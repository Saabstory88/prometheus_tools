var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/patch', function(req, res, next) {
  res.render('patch', { title: 'Express' });
});

router.get('/program', function(req, res, next) {
  res.render('program', { title: 'Express' });
});

router.get('/control', function(req, res, next) {
  res.render('control', { title: 'Express' });
});

router.get('/devices', function(req, res, next) {
  res.render('devices', { title: 'Express' });
});

module.exports = router;
