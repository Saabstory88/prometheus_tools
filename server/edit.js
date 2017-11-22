function fxMake(patchFX, color){
  let fx = {
    fixture_id: patchFX.fixture_id,
    color: {
      intensity: 65535,
      red: 0,
      green: 0,
      blue: 0
    },
    fade: 1000,
    checked: false
  }

  if(typeof(patchFX.link) != 'undefined'){
    fx.link = patchFX.link;
    fx.color.white = 0;
  }

  if(typeof(color) != 'undefined'){
    fx.color = color;
  }

  if(typeof(color) != 'undefined'){
    fx.color = color;
  }

  return fx;
}

fxMakeInt(fixture){
  let fx = {
    fixture_id: fixture.link,
    color: {
      intensity: fixture.color.white,
      red: 0,
      green: 0,
      blue: 0
    },
    fade: fixture.fade,
    checked: false
  }

  return fx;
}

function filterRGB(patch){
  let fixtures = [];

  for(let i = 0; i < patch.length; i++){
    if(patch[i].num_channels != 1){
      fixtures.push(fxMake(patch[i]));
    }
  }

  return fixtures;
}

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

//Patch
let patch = JSON.parse(fs.readFileSync(process.cwd() + '/public/json/patch/bank.json'));
//Stack
let stack = JSON.parse(fs.readFileSync(process.cwd() + '/public/json/stack/bank.json'));

let cs = stack.cuestacks[0];
cs.cuesteps = [];

let fixtures = filterRGB(patch);

console.log(fixtures);

for(let i = 0; i < pattern.length; i++){
  let cuestep = {

  }
}
