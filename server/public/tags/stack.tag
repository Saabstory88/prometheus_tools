<stack>

<div class="row">
  <div class="col col-md-3" id="sideCol">
    <div class="card sticky" style="margin-bottom: 30px;" id="editorpane">
      <div class="card-header">
        <h6>Edit</h6>
      </div>
      <div class="card-body">
        <div>
          <form onsubmit="{ applyColor }">
            <div id="mainColorPicker" class="input-group colorpicker-component">
              <input type="text" value="#00AABB" class="form-control" />
              <span class="input-group-addon"><i></i></span>
            </div>
            <br>
              <button class="btn btn-sm btn-primary" type="submit">
                Apply
              </button>
          </form>
        </div>
        <br>
        <div>
          <p> Select: </p>
          <button class="btn btn-sm btn-success" type="button" onclick="{ selectAll }">
            <i class="fa fa-square-o" aria-hidden="true"></i>
          </button>
          <button class="btn btn-sm btn-warning" type="button" onclick="{ deselectAll }">
            <i class="fa fa-window-close-o" aria-hidden="true"></i>
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="col col-md-9">
    <div class="card" style="margin-bottom: 30px;">
      <div class="card-header">

        <div class="row">
          <div class="col">
            <h5>Program</h5>
          </div>

          <div class="col">
            <div class="btn-group  float-right" role="group" aria-label="ActionButtons">
              <button type="button"
                class="btn btn-secondary" data-toggle="collapse" data-target="#colOpenStackFile"
                data-tooltip="true" data-placement="top" title="Open">
                  <i class="fa fa-folder-open-o" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#colNewStackFile">
                <i class="fa fa-file-o" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#colSaveStackFile">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-success" onclick="{ addCueStack }">
                +
              </button>
            </div>
          </div>
        </div>

        <div class="row justify-content-center" style="margin-top: 10px;">
          <div class="col-6">

            <div class="collapse control-collapse" id="colOpenStackFile">
              <div class="card">
                <div class="card-header bd-warning">
                  <h6>Open Stack
                  <button type="button" class="btn btn-info float-right" onclick="{ getStackFileList }">
                    <i class="fa fa-refresh" aria-hidden="true"></i>
                  </button>
                  </h6>
                </div>
                <div class="card-body" style="max-width: 300px;">
                  <p>Select a stack file to open:</p>
                  <form onsubmit="{ loadStackFile }">
                    <select ref="stackFS" class="form-control" id="stackFileSelect">
                      <option each={ sf, i in stackFiles } value="{ sf }">{ sf }</option>
                    </select>
                    <br>
                    <button type="submit" class="btn btn-secondary" >Open</button>
                  </form>
                </div>
              </div>
            </div>

            <div class="collapse control-collapse" id="colNewStackFile">
              <div class="card">
                <div class="card-header bd-warning">
                  <h6>New Stack</h6>
                </div>
                <div class="card-body" style="max-width: 300px;">
                  <p>Are you sure you want to create a new stack?
                  All unsaved work will be lost.</p>
                  <button type="button" class="btn btn-warning" onclick="{ newStackFile }">Confirm</button>
                </div>
              </div>
            </div>

            <div class="collapse control-collapse" id="colSaveStackFile">
              <div class="card">
                <div class="card-header bd-warning">
                  <h6>Save Stack</h6>
                </div>
                <div class="card-body" style="max-width: 300px;">
                  <form onsubmit="{ saveStackFile }">
                    <p>File name for Patch file</p>
                    <input type="text" placeholder="newPatch" ref="stackSaveName">
                    </input>
                    <br>
                    <br>
                    <button type="submit" class="btn btn-primary">Save</button>
                  </form>
                </div>
              </div>
            </div>

          </div>
        </div>

      </div>

      <div class="card-body bg-secondary">
        <div each={ cuestack, i in cuefile.cuestacks} class="card cs-card">

          <div class="card-header">
            <div class="row">
              <div class="col">
                <h6>{ cuestack.label }</h6>
              </div>
              <div class="col">
                <div class="btn-group  float-right" role="group" aria-label="ActionButtons">
                  <button type="button" class="btn btn-sm btn-dark" disabled>CUE: #{ cuestack.cuestack_id }</button>
                  <button type="button" class="btn btn-sm {cuestack.loop ? 'btn-primary' : 'btn-secondary'}" disabled>
                    Loop
                  </button>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="collapse" data-target="#colAddStep{ i }">
                    +
                  </button>
                  <button type="button" class="btn btn-sm btn-warning" data-toggle="collapse" data-target="#colEditStack{ i }">
                    <i class="fa fa-wrench" aria-hidden="true"></i>
                  </button>
                </div>
              </div>
            </div>

            <div class="collapse control-collapse" id="colEditStack{ i }">
              <div class="card" style="margin-top: 10px;">
                <div class="card-header">
                  <div class="row">
                    <div class="col">
                      <h6>Edit Cuestack</h6>
                    </div>
                    <div class="col">
                      <form onsubmit="{ deleteStack }">
                        <hidden value="{i}" name="parent"></hidden>
                        <button class="btn btn-danger float-right" type="submit">
                          <i class="fa fa-trash-o" aria-hidden="true"></i>
                        </button>
                      </form>
                    </div>
                  </div>
                </div>

                <div class="card-body" style="max-width: 300px;">
                  <p>Settings:</p>
                  <form onsubmit="{  toggleLoop }">
                    <button class="btn btn-sm btn-primary" type="submit">
                      Toggle Loop
                    </button>
                  </form>
                </div>
              </div>
            </div>

            <div class="collapse control-collapse" id="colAddStep{ i }">
              <div class="card" style="margin-top: 10px;">
                <div class="card-header">
                  <h6>Add Step</h6>
                </div>
                <div class="card-body" style="max-width: 300px;">
                  <form onsubmit="{  addStep }">
                    <button class="btn btn-success" type="submit">
                      Add
                    </button>
                  </form>
                </div>
              </div>
            </div>


          <div class="card-body">
            <div each={ step , j in cuestack.cuesteps } class="card" style="margin-bottom: 10px;">

              <div class="card-header">
                <div class="row">
                  <div class="col">
                    <div class="btn-group  float-right" role="group" aria-label="ActionButtons">
                      <button type="button " class="btn btn-sm btn-dark" disabled>
                        STEP: #{ (j + 1) }
                      </button>
                      <button type="button " class="btn btn-sm btn-primary" disabled>
                        W: { (step.wait / 1000) }s
                      </button>
                      <button type="button " class="btn btn-sm btn-primary" disabled>
                        F: { (step.fixtures[0].fade / 1000) }s
                      </button>
                      <button type="button " class="btn btn-sm btn-success" disabled>
                        <i class="fa fa-chevron-up" aria-hidden="true"></i>
                      </button>
                      <button type="button " class="btn btn-sm btn-success" disabled>
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                      </button>
                      <button id="selAll_{i}_{j}" class="btn btn-sm btn-success" type="button" onclick="{ selectThese }">
                        <i class="fa fa-square-o" aria-hidden="true"></i>
                      </button>
                      <button type="button " class="btn btn-sm btn-warning" data-toggle="collapse" data-target="#colEditStack{i}Step{j}">
                        <i class="fa fa-wrench" aria-hidden="true"></i>
                      </button>
                    </div>
                  </div>
                </div>

                <div class="collapse control-collapse" id="colEditStack{i}Step{j}">
                  <div class="card" style="margin-top: 10px;">
                    <div class="card-header">
                      <h6>Edit Step #{j + 1}
                        <form onsubmit="{ deleteStep }">
                          <hidden value="{i}" name="parent"></hidden>
                          <button class="btn btn-danger float-right" type="submit">
                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                          </button>
                        </form>
                      </h6>
                    </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <p>Timing (Seconds)</p>
                          <div class="input-group" style="margin: 5px;">
                            <input id="upWait_{ i }_{ j }" type="number" class="form-control" value="5">
                            <span class="input-group-btn">
                              <button id="btnUpWait_{ i }_{ j }"class="btn btn-warning" type="button" onclick="{ updateWait }">Update Wait</button>
                            </span>
                          </div>
                          <div class="input-group" style="margin: 5px;">
                            <input id="upFade_{ i }_{ j }" type="number" class="form-control" value="5">
                            <span class="input-group-btn">
                              <button id="btnUpFade_{ i }_{ j }"class="btn btn-warning" type="button" onclick="{ updateFade }">Update Fade</button>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div class="card-body bg-dark">
                <div class="row">
                  <div each='{ fixture, k in step.fixtures }'
                    class="card cue-fx-card"
                    style="border-width: 4px; border-color: { fixture.checked ? '#0f0' : '#aaa'}">
                    <div class="card-header" style="padding-bottom: 0px;">
                      <p style="white-space:nowrap; text-align: center;">{ fixture.fixture_id }</p>
                    </div>
                    <div class="card-body"
                      onclick="{ toggleSelect }"
                      id="fx_{i}_{j}_{k}"
                      style="border-radius:3px; max-width: 36px; background-color: { fxColor(fixture.color) }">
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
    </div>

      <div class="card-footer">
        <p>Stack: </p>
        <p>Patch: { localStorage.getItem('patchName') }</p>
      </div>

    </div>
  </div>
</div>

<script>

let self = this;

//-------------------------------------------
//LIST OPS
//-------------------------------------------

selectThese(e){
  e.preventDefault();
  elID = e.srcElement.id.split('_');
  let csid = parseInt(elID[1]);
  let stid = parseInt(elID[2]);
  for(let i = 0; i < this.cuefile.cuestacks[csid].cuesteps[stid].fixtures.length; i++){
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[i].checked = true;
  }
}

updateWait(e){
  e.preventDefault();
  let elID = '#' + e.srcElement.id.replace("btnUpWait", "upWait");
  let fadeTime = parseInt($(elID)[0].value * 1000);
  elID = elID.split('_');
  let csid = parseInt(elID[1]);
  let stid = parseInt(elID[2]);
  this.cuefile.cuestacks[csid].cuesteps[stid].wait = fadeTime;
}

updateFade(e){
  e.preventDefault();
  let elID = '#' + e.srcElement.id.replace("btnUpFade", "upFade");
  let fadeTime = parseInt($(elID)[0].value * 1000);
  elID = elID.split('_');
  let csid = parseInt(elID[1]);
  let stid = parseInt(elID[2]);
  for(let i = 0; i < this.cuefile.cuestacks[csid].cuesteps[stid].fixtures.length; i++){
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[i].fade = fadeTime;
    console.log(this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[i])
  }
}

applyColor(e){
  e.preventDefault();
  let color = $('#mainColorPicker').data('colorpicker').color.toRGB();
  color.a = parseInt(color.a * 65535);
  console.log(color);
  this.setColorActive(color);
}

setColorActive(color){
  for(let i = 0; i < this.cuefile.cuestacks.length; i++){
    for(let j = 0; j < this.cuefile.cuestacks[i].cuesteps.length; j++){
      for(let k = 0; k < this.cuefile.cuestacks[i].cuesteps[j].fixtures.length; k++){
        if(this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].checked){
          this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].color.red = color.r;
          this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].color.green = color.g;
          this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].color.blue = color.b;
          this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].color.intensity = color.a;
        }
      }
    }
  }
}

batchSelect(state){
  for(let i = 0; i < this.cuefile.cuestacks.length; i++){
    for(let j = 0; j < this.cuefile.cuestacks[i].cuesteps.length; j++){
      for(let k = 0; k < this.cuefile.cuestacks[i].cuesteps[j].fixtures.length; k++){
        this.cuefile.cuestacks[i].cuesteps[j].fixtures[k].checked = state
      }
    }
  }
}

selectAll(e){
  e.preventDefault();
  this.batchSelect(true);
  this.save();
}

deselectAll(e){
  e.preventDefault();
  this.batchSelect(false);
  this.save();
}

toggleSelect(e){
  console.log(e.target.id)
  let fxkey = e.target.id.split('_');
  let csid = parseInt(fxkey[1]);
  let stid = parseInt(fxkey[2]);
  let fxid = parseInt(fxkey[3]);

  if(typeof(this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[fxid]) != 'undefined'){
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[fxid].checked = !(this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[fxid].checked )
  } else {
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[fxid].checked = true;
  }
  console.log(this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[fxid]);
  this.save();
}

parseFixture(fixture){
  let pf = {};
  pf.fixture_id = fixture.fixture_id;
  pf.color = {
    intensity: 0
  };
  let cm = fixture.channel_map;
  for(let i = 0; i < cm.length; i++){
    let param = cm[i];
    if (param == 2){
      pf.color.red = 0;
    } else if (param == 3){
      pf.color.green = 0;
    } else if (param == 4){
      pf.color.blue = 0;
    } else if (param == 5){
      pf.color.white = 0;
    }
  }
  return pf;
}

newCuestack(opts){
  let newCS = {
    cuestack_id: opts.id,
    label: opts.label,
    loop: opts.loop,
    tweet: "None",
    cuesteps: []
  }
  return newCS;
}

newCuestep(opts){
  let newCS = {
    wait: opts.wait,
  }
  newCS.fixtures = new Array();

  for(let i = 0; i < this.fixtures.length; i++){
    newCS.fixtures.push(this.parseFixture(this.fixtures[i]));
  }

  for(let i = 0; i < newCS.fixtures.length; i++){
    newCS.fixtures[i].fade = opts.fade;
  }

  return newCS;
}

fxColor(params){
  let rgb = {
    r: 0,
    g: 0,
    b: 0
  }
  if(params.red){
    rgb.r = parseInt(params.red * (params.intensity / 65535));
  }
  if (params.green){
    rgb.g = parseInt(params.green * (params.intensity / 65535));
  }
  if (params.blue){
    rgb.b = parseInt(params.blue * (params.intensity / 65535));
  }
  return ("#" +
    ("0" + parseInt(rgb.r,10).toString(16)).slice(-2) +
    ("0" + parseInt(rgb.g,10).toString(16)).slice(-2) +
    ("0" + parseInt(rgb.b,10).toString(16)).slice(-2));
}

toggleLoop(e){
  e.preventDefault();
  let index = e.item.i;
  console.log("Index: " + index);
  this.cuefile.cuestacks[index].loop = !this.cuefile.cuestacks[index].loop;
  this.update();
  this.save();
}

deleteStep(e){
  e.preventDefault();
  //console.log(e);
  let csIndex = e.srcElement.children[0].value;
  let stepIndex = e.item.j;
  console.log("Will delete: " + csIndex + "/" + stepIndex);
  this.cuefile.cuestacks[csIndex].cuesteps.splice(stepIndex, 1);
}

deleteStack(e){
  e.preventDefault();
  let stepIndex = e.item.i;
  console.log("Will delete: " + stepIndex);
  this.cuefile.cuestacks.splice(stepIndex, 1);
}

addStep(e){
  e.preventDefault();
  let index = e.item.i;
  let newStep = this.newCuestep({
    wait: 1000,
    fade: 1000
  });
  console.log(newStep)
  this.cuefile.cuestacks[index].cuesteps.push(newStep);
  this.update();
  this.save();
}

//-------------------------------------------
//FILE OPS
//-------------------------------------------

save(){
  this.cuefile.patch = localStorage.getItem('patchName');
  localStorage.setItem('cuefile', JSON.stringify(this.cuefile, null, 2));
  this.cuefile = JSON.parse(localStorage.getItem('cuefile'));
  this.getStackFileList();
}

addCueStack(e){
  e.preventDefault();
  this.cuefile.cuestacks.push(this.newCuestack({
    id: (this.cuefile.cuestacks.length),
    label: "New Stack",
    loop: false,
    tweet: "None"
  }));
  this.save();
}

newStackFile(){
  this.cuefile = {};
  this.cuefile.version = 1;
  this.cuefile.cuestacks = new Array();
  let newStack = this.newCuestack({
    id: 0,
    label: "New Stack",
    loop: false,
  });
  newStack.cuesteps.push(this.newCuestep({
    wait: 1000,
    fade: 1000
  }));
  this.cuefile.cuestacks.push(newStack);
  console.log(this.cuefile.cuestacks)
  this.save();
}

getStackFileList(){
  let url = '/api/stack/list'; //random adress
  $.ajax({
    url: url,
    type: "GET",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function(data) {
      self.stackFiles = data
    }
  });
  //console.log(self.patchFiles);
}

saveStackFile(e){
  e.preventDefault();

  this.save();

  let filename = this.refs.stackSaveName.value;
  filename = filename.split('.')[0];
  localStorage.setItem('stackName', (filename + '.json'));
  let url = '/api/stack/save/' + filename;

  console.log(url);

  let data = JSON.stringify(this.cuefile);
  //console.log(data);

  $.ajax({
    type: "POST",
    url: url,
    contentType: "application/json",
    dataType: "json",
    success: function (msg) {
      console.log(msg);
    },
    error: function(error){
      console.log("Something went wrong", error);
    },
    data: data
  });

}

loadStackFile(e){
  e.preventDefault();
  let filename = this.refs.stackFS.value;
  localStorage.setItem('stackName', filename);
  self.stackName = localStorage.getItem('stackName');
  let url = '/json/stack/' + filename;

  $.ajax({
    url: url,
    type: "GET",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function(data) {
      console.log(data);
      self.cuefile = data;
      if(self.cuefile.patch){
        localStorage.setItem('patchName', self.cuefile.patch);
        self.loadPatchFile();
      }
      self.update();
      self.save();
    }
  });
}

loadPatchFile(){
  let filename = localStorage.getItem('patchName');
  let url = '/json/patch/' + filename;

  $.ajax({
    url: url,
    type: "GET",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function(data) {
      console.log("Got patch " + filename);
      self.fixtures = data;
      self.update();
      self.save();
      console.log(self.fixtures);
    }
  });
}

//-------------------------------------------
//INIT
//-------------------------------------------

//Copy of fixture patch to use as template for stack

//-------------------------------------------
/*CLASSES
- 0x01 : Intensity
- 0x02 : Red
- 0x03 : Green
- 0x04 : Blue
- 0x05 : White
- 0x06 : Cool White
- 0x07 : Warm White
//-------------------------------------------*/


if(localStorage.getItem('cuefile') != null){
  console.log("A cuefile exists in localStorage")
  this.cuefile = JSON.parse(localStorage.getItem('cuefile'));
  console.log(this.cuefile)
  this.update();
  this.save();
} else {
  this.cuefile = {
    version: 1,
    cuestacks: []
  }
}

if(localStorage.getItem("patchName") != null){
  this.loadPatchFile();
} else if (localStorage.getItem("patch") != null){
  this.fixtures = localStorage.getItem("patch");
} else {
  this.fixtures = [];
}

$(function() {
  $('#mainColorPicker').colorpicker({
    format: 'rgba'
  });
});

</script>

</stack>
