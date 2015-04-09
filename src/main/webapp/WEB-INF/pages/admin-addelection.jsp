<div id="bodycontent">
  <h2>Add New Election</h2>
  <div class="panel panel-default">
    <div class="panel-body">
      <div class="input-group">
        <form method="POST" action="/admin/add" onsubmit="return validateAddElection(this);">
          <div class="form-group">
            <label for="electionName">Election Name</label>
            <input type="text" class="form-control" id="electionName" name="electionName" placeholder="" required>
          </div><br/><br/>
          <div class="form-group">
            <label for="electionChoice1">Choice 1</label>
            <input type="text" class="form-control" name="electionChoice1" id="electionChoice1" placeholder="" required>
          </div><br/><br/>
          <div class="form-group">
            <label for="electionChoice1">Choice 2</label>
            <input type="text" class="form-control" name="electionChoice2" id="electionChoice2" placeholder="" required>
          </div><br/><br/>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>