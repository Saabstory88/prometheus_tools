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
                  <select ref="patchFS" class="form-control" id="stackFileSelect">
                    <option each={ pf, i in patchFiles } value="{ pf }">{ pf }</option>
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
    <div class="card-body">
    </div>
  </div>


<script>

let self = this;

//-------------------------------------------
//FILE OPS
//-------------------------------------------

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

parseFixture(fixture){
  let pf = {};
  pf.color = {};
  let cm = fixture.channel_map;
  for(let i = 0; i < cm.length; i++){
    let param = cm[i];
    if(param == 1){
      pf.color.intensity = 0;
    } else if (param == 2){
      pf.color.red = 0;
    } else if (param == 3){
      pf.color.green = 0;
    } else if (param == 4){
      pf.color.blue = 0;
    } else if (param == 5){
      pf.color.white = 0;
    }
  }
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

  for(let i = 0; i < opts.fixtures.length; i++){
    newCS.fixtures.push(parseFixture(opts.fixtures[i]));
  }

  for(let i = 0; i < newCS.fixtures.length; i++){
    newCS.fixtures[i].fade = opts.fade;
  }

  return newCS;
}


this.fixtures = [];


if(localStorage.getItem("patchName") != null){
  this.loadPatchFile();
  this.fixtures = JSON.parse(localStorage.getItem("patch"));
} else if (localStorage.getItem("patchName") != null){

}

</script>

</stack>
