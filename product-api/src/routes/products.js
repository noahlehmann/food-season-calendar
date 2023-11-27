var express = require('express');
var router = express.Router();
var db = require("../database/db-init")

/* GET users listing. */
router.get('/', function(req, res, next) {
  let query = "SELECT * FROM t_product";
  db.get(query, [], (err, row) => {
    res.send(row);
  });
});

module.exports = router;
