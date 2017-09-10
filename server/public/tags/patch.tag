<patch>
  <div class="card" style="margin-bottom: 30px;">
    <div class="card-header">

      <div class="row">
        <div class="col">
          <h5>Patch</h5>
        </div>
        <div class="col">
          <div class="btn-group  float-right" role="group" aria-label="ActionButtons">
            <button type="button"
              class="btn btn-secondary" data-toggle="collapse" data-target="#colOpenPatchFile"
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

          <div class="collapse control-collapse" id="colOpenPatchFile">
            <div class="card">
              <div class="card-header bd-warning">
                <h6>Open Patch</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <p>Select a patch file to open:</p>
                <button type="button" class="btn btn-secondary" onclick="{ newPatchFile }">Open</button>
              </div>
            </div>
          </div>

          <div class="collapse control-collapse" id="colNewPatchFile">
            <div class="card">
              <div class="card-header bd-warning">
                <h6>New Patch</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <p>Are you sure you want to create a new patch?
                All unsaved work will be lost.</p>
                <button type="button" class="btn btn-warning" onclick="{ newPatchFile }">Confirm</button>
              </div>
            </div>
          </div>

          <div class="collapse control-collapse" id="colSavePatchFile">
            <div class="card">
              <div class="card-header bd-warning">
                <h6>Save Patch</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <p>File name for Patch file</p>
                <button type="button" class="btn btn-primary" onclick="{ newPatch }">Save</button>
              </div>
            </div>
          </div>

          <div class="collapse control-collapse" id="colAddPatchFixture">
            <div class="card">
              <div class="card-header">
                <h6>Add Fixture</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <form onsubmit="{ addPatchFixture }">
                  <label for="newFixtureLabel">Fixture Label</label>
                  <input class="form-control" type="text" placeholder="{ newFx.label }" id="newFixtureLabel">
                  <label style="padding-top: 5px;" for="newFixtureAddr">Start Address</label>
                  <input class="form-control" type="text" placeholder="{ newFx.start_address }" id="newFixtureAddr">
                  <br>
                  <button type="submit" class="btn btn-success">Add</button>
                </form>
              </div>
            </div>
          </div>

          <div class="collapse control-collapse" id="colRemovePatchFixture">
            <div class="card">
              <div class="card-header">
                <h6>Remove Fixture</h6>
              </div>
              <div class="card-body" style="max-width: 300px;">
                <form onsubmit="{ removePatchFixture }" class="form-inline">
                  <button type="submit" class="btn btn-danger" style="margin-right: 10px;">Remove</button>
                  <select ref="fxToRemove" class="form-control" id="exampleFormControlSelect1">
                    <option each={ fixtures }>{ label }</option>
                  </select>
                </form>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>

    <div class="card-body bg-secondary">

    <div class="row" style="padding-left: 10px; padding-right: 10px;">
      <div each={ fixtures } class="card card-fixture">
        <div class="card-header">
          <h6><span class="badge badge-success">{ start_address }</span> { label }<h6>
        </div>
        <div class="card-body">
          <p>Parameters:</p>
          <span class="badge badge-danger">{ start_address }</span>
          <span class="badge badge-success">{ start_address + 1 }</span>
          <span class="badge badge-primary">{ start_address + 2 }</span>
          <span class="badge badge-warning">{ start_address + 3 }</span>
        </div>
      </div>
    </div>

  </div>
  <div class="card-footer">
    <button type="button" class="btn btn-info float-right" data-toggle="collapse" data-target="#colDmxFill">
      <i class="fa fa-th" aria-hidden="true"></i>
    </button>

    <div class="collapse control-collapse" id="colDmxFill">
      <div class="card">
        <div class="card-header">
          <h6>DMX Graph</h6>
        </div>
        <div class="card-body">
          <div class="row">
            <div each="{ dmxLayout }">
              <div style="width: 25px; margin: 2px; padding: 2px; background-color: {full ? '#0f0' : '#888'};">
                <p align="center" style=" font-size: 8px; ">{ adr }</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

</div>

<script>

  //-------------------------------------------
  //FILES
  //-------------------------------------------

  newPatchFile(e){
    e.preventDefault();
    this.fixtures = [];
    this.save();
  }

  removePatchFixture(e){
    e.preventDefault();
    console.log("Removing Fixture!");
    //console.log(e);
    //console.log(e.target[1].options.selectedIndex);
    this.fixtures.splice(e.target[1].options.selectedIndex, 1);
    this.save();
  }

  save(){
    localStorage.setItem("patch", JSON.stringify(this.fixtures));
    this.fixtures = JSON.parse(localStorage.getItem("patch"));
    this.lastSave = new Date();
    this.calculateDMX();
    this.refreshNewFixture();
  }

  //-------------------------------------------
  //FIXTURES
  //-------------------------------------------

  this.newFx = {
      "channel_map": [
          1,
          2,
          3,
          4
      ],
      "fixture_id": 1,
      "fixture_type": 1,
      "label": "Fixture 1",
      "num_channels": 4,
      "start_address": 1
  }

  refreshNewFixture(){
    if(this.fixtures.length != 0){
      let lastFx = this.fixtures[this.fixtures.length - 1];
      this.newFx.start_address = lastFx.start_address + lastFx.num_channels;
      this.newFx.label = "Fixture " + (this.fixtures.length + 1).toString();
    } else {
      this.newFx = {
          "channel_map": [
              1,
              2,
              3,
              4
          ],
          "fixture_id": 1,
          "fixture_type": 1,
          "label": "Fixture 1",
          "num_channels": 4,
          "start_address": 1
      }
    }

    this.newFx.num_channels = this.newFx.channel_map.length;
  }

  addPatchFixture(e) {
    e.preventDefault();

    this.fixtures.push($.extend({}, this.newFx));
    this.save();

  }

  calculateDMX(){
    this.dmxLayout = new Array();

    for(let i = 0; i < 1024; i++){
      let newEl = {
        adr: i+1,
        full: false
      }
      this.dmxLayout.push(newEl);
    }


    for(let i = 0; i < this.fixtures.length; i++){
      let start = (this.fixtures[i].start_address - 1);
      let end = (this.fixtures[i].channel_map.length + start);
      for(let j = start; j < end; j++){
        this.dmxLayout[j].full = true;
      }
    }
  }

  //-------------------------------------------
  //INIT
  //-------------------------------------------

  //Just for sanity
  console.log(localStorage.getItem("patch"));

  this.lastSave = new Date(); //Track last save to localStorage

  if(localStorage.getItem("patch") == null){
    this.fixtures = [];
    this.save();
  } else {
    this.fixtures = JSON.parse(localStorage.getItem("patch"));
    this.calculateDMX();
  }

  this.refreshNewFixture();

  //Track the dmx layout


  </script>

</patch>
