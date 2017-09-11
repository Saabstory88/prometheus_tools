var express = require('express');
var router = express.Router();

const fs = require('fs');

let pathPatch = process.cwd() + "/public/json/patch";
console.log("API: patch path = " + pathPatch);

/* GET home page. */
router.use('/patch/list', function(req, res, next) {
  res.json(fs.readdirSync(pathPatch));
});

router.use('/patch/save/:name', function(req, res, next) {
  console.log(req.params);
  let p = pathPatch + '/' + req.params.name + '.json';
  let patchToStore = JSON.stringify(req.body);
  fs.writeFile(p, patchToStore, function(err){
    if(err){
      res.json({
        status: "Error"
      });
    } else {
      res.json({
        status: "Okay"
      });
    }
  });
});

module.exports = router;
