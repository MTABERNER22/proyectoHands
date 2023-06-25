var pool = require('./bd');

async function getProductoById(id) {
    var query = "select * from productos where id = ?";
    var rows = await pool.query(query,[id] );
    return rows;
};
module.exports = { getProductoById }

