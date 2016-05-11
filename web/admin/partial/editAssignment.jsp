<div class="modal fade" tabindex="-1" role="dialog" id="editBatch">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit Batch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="batchId">Batch ID</label>
                        <input type="text" class="form-control" id="ebatchId" name="batchName"  maxlength="50" disabled value="${batch.batchId}">
                    </div>
                    <div class="form-group">
                        <label for="batchName">Batch name</label>
                        <input type="text" class="form-control" id="ebatchName" name="batchName"  maxlength="50" value="${batch.batchName}">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveB">Save Batch</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->