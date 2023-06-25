var express = require('express');
var router = express.Router();
var detalleModel = require('../models/detalleModel');
var cloudinary = require('cloudinary').v2;

/* GET home page. */
router.get('/:id', async function(req, res, next) {
    var id = req.params.id;
    var producto = await detalleModel.getProductoById(id) 
    producto = producto.map(producto => {
        if (producto.img_id) {
          const imagen = cloudinary.url(producto.img_id, {
            width: 460,
            crop: 'fill'
          });
          return {
            ...producto,
            imagen
          }
        } else {
          return {
            ...producto,
            imagen: '/images/noimage.jpg'
          }
        }
      });
    res.render('detalle',{
        producto
    });
});




module.exports = router;
