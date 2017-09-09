<patch>
  <div class="card">
    <div class="card-header">

      <div class="row">
        <div class="col">
          <h5>Patch</h5>
        </div>
        <div class="col">
          <div class="btn-group  float-right" role="group" aria-label="ActionButtons">
            <button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#colOpenPatchFile"><i class="fa fa-folder-open-o" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#colNewPatchFile"><i class="fa fa-file-o" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#colSavePatchFile"><i class="fa fa-floppy-o" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#colAddPatchFixture">+</button>
            <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#colRemovePatchFixture">-</button>
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

</div>

<script>

  newPatchFile(e){
    this.fixtures = [];
    e.preventDefault();
  }

  removePatchFixture(e){
    console.log("Removing Fixture!");
    //console.log(e);
    //console.log(e.target[1].options.selectedIndex);
    this.fixtures.splice(e.target[1].options.selectedIndex, 1)
    e.preventDefault();
  }

  addPatchFixture(e) {
    let newFx = {
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
    if(this.fixtures.length != 0){
      let lastFx = this.fixtures[this.fixtures.length - 1];
      newFx.start_address = lastFx.start_address + lastFx.num_channels;
      newFx.label = "Fixture " + (this.fixtures.length + 1).toString();
    }
    this.fixtures.push(newFx);
    e.preventDefault()
  }

  this.fixtures = [
      {
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
      },
      {
          "channel_map": [
              1,
              2,
              3,
              4
          ],
          "fixture_id": 2,
          "fixture_type": 1,
          "label": "Fixture 2",
          "num_channels": 4,
          "start_address": 5
      }
  ]

  </script>

</patch>
