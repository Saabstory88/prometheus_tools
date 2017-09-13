<stack>

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
            <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#colNewPatchFile">
              <i class="fa fa-file-o" aria-hidden="true"></i>
            </button>
            <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#colSavePatchFile">
              <i class="fa fa-floppy-o" aria-hidden="true"></i>
            </button>
            <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#colAddPatchFixture">
              +
            </button>
            <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#colRemovePatchFixture">
              -
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
                <h6>Edit Cuestack</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <p>Settings:</p>
                <form onsubmit="{  toggleLoop }">
                  <button class="btn btn-primary" type="submit">
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
                      { (step.wait / 1000) }s
                    </button>
                    <button type="button " class="btn btn-sm btn-success" disabled>
                      <i class="fa fa-chevron-up" aria-hidden="true"></i>
                    </button>
                    <button type="button " class="btn btn-sm btn-success" disabled>
                      <i class="fa fa-chevron-down" aria-hidden="true"></i>
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
                    <h6>Edit Step {j + 1}
                      <form onsubmit="{ deleteStep }">
                        <hidden value="{i}" name="parent"></hidden>
                        <button class="btn btn-danger float-right" type="submit">
                          <i class="fa fa-trash-o" aria-hidden="true"></i>
                        </button>
                      </form>
                    </h6>
                  </div>
                  <div class="card-body">
                    <form onsubmit="{ changeFixtures }">
                      <div class="row">
                        <div class="col-md-6">
                          <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">FX:</span>
                            <select multiple class="form-control" id="fxSel_{i}_{j}">
                              <option each="{ fixture, k in step.fixtures }" value="{ k }">
                                { fixture.fixture_id }
                              </option>
                            </select>
                          </div>
                          <br>
                          <button class="btn btn-warning" type="submit">
                            Edit
                          </button>
                        </div>
                        <div class="col-md-6" >
                          <div class="input-group">
                            <span class="input-group-addon" style="background-color: #fdd;">Red:</span>
                            <input class="form-control num-in " type="number" min="0" max="100" step="1" value="0"></input>
                          </div>
                          <div class="input-group">
                            <span class="input-group-addon" style="background-color: #dfd;">Green:</span>
                            <input class="form-control num-in " type="number" min="0" max="100" step="1" value="0"></input>
                          </div>
                          <div class="input-group">
                            <span class="input-group-addon" style="background-color: #ddf;">Blue:</span>
                            <input class="form-control num-in " type="number" min="0" max="100" step="1" value="0"></input>
                          </div>
                          <div class="input-group">
                            <span class="input-group-addon" style="background-color: #ddd;">Intensity:</span>
                            <input class="form-control num-in " type="number" min="0" max="100" step="1" value="100"></input>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

            </div>

            <div class="card-body bg-dark">
              <div class="row">
                <div each='{ fixture, i in step.fixtures }' class="card cue-fx-card">
                  <div class="card-header" style="padding-bottom: 0px;">
                    <p>{ fixture.fixture_id }</p>
                  </div>
                  <div class="card-body" style="border-radius:3px; border-color: #000; border-width: 2px; background-color: { fxColor(fixture.color) }">
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


<script>

let self = this;

//-------------------------------------------
//LIST OPS
//-------------------------------------------
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
    label: otps.label,
    loop: otps.loop,
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
  let index = e.item.cuestack.cuestack_id - 1;
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

changeFixtures(e){
  e.preventDefault();
  let selID = '#' + e.target[0].id;

  console.log(e.target[0].id);

  let sel = $(selID).val();

  selID = selID.split('_');

  let csid = parseInt(selID[1]);
  let stid = parseInt(selID[2]);

  let color = {}

  color.r = parseInt(e.target[2].value / 100 * 255);
  color.g = parseInt(e.target[3].value / 100 * 255);
  color.b = parseInt(e.target[4].value / 100 * 255);
  color.i = parseInt(e.target[5].value / 100 * 65535);

  for(let i = 0; i < sel.length; i++){
    let index = parseInt(sel[i]);
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[index].color.red = color.r;
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[index].color.green = color.g;
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[index].color.blue = color.b;
    this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[index].color.intensity = color.i;
    console.log(this.cuefile.cuestacks[csid].cuesteps[stid].fixtures[index].color);
  }

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

createNewStack(){
  this.cuefile = [];
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

</script>

</stack>
