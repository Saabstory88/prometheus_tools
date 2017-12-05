function* ci(o, m) {
  let i = o;

  while(true){
    if(i < m){
      i++;
    } else {
      i = 0;
    }
    yield i;
  }
}

class Fixture {
  constructor(patch){
    this.fixture_id = patch.fixture_id;

    this.color = {};

    this.color.intensity = 0;

    if(patch.channel_map.includes(2)){
      this.color.red = 0;
    }
    if(patch.channel_map.includes(3)){
      this.color.green = 0;
    }
    if(patch.channel_map.includes(4)){
      this.color.blue = 0;
    }
    if(typeof(patch.link) != 'undefined'){
      this.color.white = 0;
      this.link = patch.link
    }

    this.fade = 1000;
  }
}

class FXTool {
  constructor(patch){
    this.patch = patch;
    this.fixtures = FXTool.filterRGB(patch);
  }

  static filterRGB(patch){
    let fixtures = [];

    for(let i = 0; i < patch.length; i++){
      if(patch[i].num_channels != 1){
        fixtures.push(new Fixture(patch[i]));
      }
    }

    return fixtures;
  }

  applyPattern(pattern){
    this.fixtures = FXTool.filterRGB(patch);

    ci = function*(o, m) {
    let i = o;

    while(true)
      if(i < m){
        i++;
      } else {
        i = 0;
      }
      yield i;
    }

    for(let i = 0; i < this.fixtures.length; i++){
      console.log(ci())
    }
  }


}

module.exports.FXTool = FXTool;
