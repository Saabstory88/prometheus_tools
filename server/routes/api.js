var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/patch/list', function(req, res, next) {
  res.json(new Array());
});

router.get('/patch/save', function(req, res, next) {
  res.json(new Array());
});

router.get('/patch/load', function(req, res, next) {
  res.json(new Array());
});

module.exports = router;
