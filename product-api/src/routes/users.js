var express = require('express');
var router = express.Router();
var db = require("../database/db-init")

/* GET users listing. */
router.get('/', function(req, res, next) {
  db.get("SELECT * FROM users", [], (err, row) => {
    res.send(row);
  });
});

module.exports = router;
