var pool = require('./bd');

async function getNovedades() {
    var query = 'select * from novedades';
    var rows = await pool.query(query);
    return rows;
}

async function getProductos() {
    var query = 'select * from productos';
    var rows = await pool.query(query);
    return rows;
}

async function deleteNovedadesById(id) {
    var query = 'delete from novedades where id = ?';
    var rows = await pool.query(query, [id]);
    return rows;
};

async function deleteProductosById(id) {
    var query = 'delete from productos where id = ?';
    var rows = await pool.query(query, [id]);
    return rows;
};

async function insertNovedad(obj) {
    try{
        var query = 'insert into novedades set ?';
        var rows = await pool.query(query,[obj] );
        return rows;
    } catch (error){
        console.log(error);
        throw error
    }

};

async function insertProducto(obj) {
    try{
        var query = 'insert into productos set ?';
        var rows = await pool.query(query,[obj] );
        return rows;
    } catch (error){
        console.log(error);
        throw error
    }

};

async function getNovedadById(id) {
    var query = "select * from novedades where id = ?";
    var rows = await pool.query(query,[id] );
    return rows [0];
};

async function getProductoById(id) {
    var query = "select * from productos where id = ?";
    var rows = await pool.query(query,[id] );
    return rows [0];
};

async function modificarNovedadById(obj, id) {
    try{
        var query = "update novedades set ? where id = ?";
        var rows = await pool.query(query,[obj, id] );
        return rows;
    } catch (error){
        throw error
    }
};

async function modificarProductoById(obj, id) {
    try{
        var query = "update productos set ? where id = ?";
        var rows = await pool.query(query,[obj, id] );
        return rows;
    } catch (error){
        throw error
    }
};

async function buscarNovedades(busqueda){
    var query = "select * from novedades where titulo like ? OR subtitulo like ? OR cuerpo like ? ";
    var rows = await pool.query(query,['%' + busqueda + '%', '%' + busqueda + '%', '%' + busqueda + '%']);
    return rows;
 }
 async function buscarProductos(busqueda){
    var query = " select * from productos where tituloProducto like ? OR precioProducto like ? ";
    var rows = await pool.query(query,['%' + busqueda + '%', '%' + busqueda + '%', '%' + busqueda + '%']);
    return rows;
 }
 

module.exports = { getNovedades, getProductos, deleteNovedadesById, deleteProductosById, insertNovedad, insertProducto, getProductoById, getNovedadById, modificarNovedadById, modificarProductoById, buscarNovedades, buscarProductos}