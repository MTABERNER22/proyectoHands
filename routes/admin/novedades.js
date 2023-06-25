var express = require('express');
var router = express.Router();
var novedadesModel = require('../../models/novedadesModel');
var util = require('util');
var cloudinary = require('cloudinary').v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);

/* GET home page. */
router.get('/', async function (req, res, next) {
  var productos
  var novedades
  if (req.query.q === undefined) {
    novedades = await novedadesModel.getNovedades();
    productos = await novedadesModel.getProductos();
  } else {
    novedades = await novedadesModel.buscarNovedades(req.query.q);
    productos = await novedadesModel.buscarProductos(req.query.q);
  }

  productos = productos.map(producto => {
    if (producto.img_id) {
      const imagen = cloudinary.image(producto.img_id, {
        width: 50,
        height: 50,
      });
      return {
        ...producto,
        imagen
      }
    } else {
      return {
        ...producto,
        imagen: ""
      }
    }
  });
  console.log(productos)
  res.render('admin/novedades', {
    layout: 'admin/layout',
    usuario: req.session.nombre,
    novedades,
    productos,
    is_search: req.query.q !== undefined,
    q: req.query.q
  })
})



router.get('/eliminar/:id', async (req, res, next) => {
  var id = req.params.id;
  var id2 = req.params.id;
  let producto = await novedadesModel.getProductoById(id);
  if (producto.img_id) {
    await (destroy(producto.img_id));
  }
  await novedadesModel.deleteNovedadesById(id);
  await novedadesModel.deleteProductosById(id2);
  res.redirect('/admin/novedades');
});

router.get('/agregarNovedad', async (req, res, next) => {
  res.render('admin/agregarNovedad', {
    layout: 'admin/layout'
  });
});

router.get('/agregarProducto', async (req, res, next) => {
  res.render('admin/agregarProducto', {
    layout: 'admin/layout'
  });
});

router.post('/agregarNovedad', async (req, res, next) => {
  try {
    if (req.body.titulo != "" && req.body.subtitulo != "" && req.body.cuerpo != "") {
      await novedadesModel.insertNovedad(req.body);
      res.redirect('/admin/novedades')
    } else {
      res.render('admin/agregarNovedad', {
        layout: 'admin/layout',
        error: true,
        message: 'Todos los campos son requeridos'
      })
    }
  } catch (error) {
    console.log(error)
    res.render('admin/agregarNovedad', {
      layout: 'admin/layout',
      error: true,
      message: 'No se carga la novedad'
    })

  }
});

router.post('/agregarProducto', async (req, res, next) => {
  try {
    var img_id = '';
    if (req.files && Object.keys(req.files).length > 0) {
      imagen = req.files.imagen;
      img_id = (await uploader(imagen.tempFilePath)).public_id;
    }
    if (req.body.tituloProducto != "" && req.body.precioProducto != "") {
      await novedadesModel.insertProducto({
        ...req.body,
        img_id
      });
      res.redirect('/admin/novedades')
    } else {
      res.render('admin/agregarProducto', {
        layout: 'admin/layout',
        error: true,
        message: 'Todos los campos son requeridos'
      })
    }
  } catch (error) {
    console.log(error)
    res.render('admin/agregarProducto', {
      layout: 'admin/layout',
      error: true,
      message: 'No se carga la novedad'
    })

  }
});

router.get('/modificarNovedad/:id', async (req, res, next) => {
  var id = req.params.id;
  var novedad = await novedadesModel.getNovedadById(id);
  res.render('admin/modificarNovedad', {
    layout: 'admin/layout',
    novedad
  })
});
router.get('/modificarProducto/:id', async (req, res, next) => {
  var id = req.params.id;
  var producto = await novedadesModel.getProductoById(id);
  res.render('admin/modificarProducto', {
    layout: 'admin/layout',
    producto
  })
});


router.post('/modificarNovedad', async (req, res, next) => {
  try {
    var obj = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      cuerpo: req.body.cuerpo,
    }
    await novedadesModel.modificarNovedadById(obj, req.body.id);
    res.redirect('/admin/novedades');
  }
  catch (error) {
    console.log(error)
    res.render('admin/modificarNovedad', {
      layout: 'admin/layout',
      error: true,
      message: 'No se modifico la novedad'
    })
  }
});

router.post('/modificarProducto', async (req, res, next) => {
  try {
    let img_id = req.body.img_original;
    let borrar_img_vieja = false;
    if (req.body.img_delete === "1") {
      img_id = null;
      borrar_img_vieja = true;
    } else {
      if (req.files && Object.keys(req.files).length > 0) {
        imagen = req.files.imagen;
        img_id = (await
          uploader(imagen.tempFilePath)).public_id;
        borrar_img_vieja = true
      }
    }
    if (borrar_img_vieja && req.body.img_original) {
      await (destroy(req.body.img_original))
    }
    var obj = {
      tituloProducto: req.body.tituloProducto,
      precioProducto: req.body.precioProducto,
      img_id
    }
    await novedadesModel.modificarProductoById(obj, req.body.id);
    res.redirect('/admin/novedades');
  }
  catch (error) {
    console.log(error)
    res.render('admin/modificarProducto', {
      layout: 'admin/layout',
      error: true,
      message: 'No se modifico el producto'
    })
  }
});







module.exports = router;