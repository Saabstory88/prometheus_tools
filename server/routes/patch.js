var express = require('express');
var router = express.Router();

const fs = require('fs');

let patch = fs.readFileSync(process.cwd() + '/json/patch.json')

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.json(JSON.stringify(patch));
});

module.exports = router;
