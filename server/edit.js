

let pattern = [
  {
    fade: 1000,
    wait: 10000,
    repeat: 1,
    colors: [
      {
        red: 232,
        green: 227,
        blue: 161,
        white: 65535
      }
    ]
  }
]

const fs = require('fs');

const FXTool = require('./public/js/fxtool.class.js').FXTool;

//Patch
let patch = JSON.parse(fs.readFileSync(process.cwd() + '/public/json/patch/bank.json'));
//Stack
let stack = JSON.parse(fs.readFileSync(process.cwd() + '/public/json/stack/bank.json'));

let cs = stack.cuestacks[0];
cs.cuesteps = [];

let fx = new FXTool(patch);

console.log(fx.fixtures);
