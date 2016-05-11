<div class="modal fade" tabindex="-1" role="dialog" id="deleteBatch">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Delete Batch</h4>
                </div>
                <div class="modal-body">
                    Delete batch ${batch.batchName} ?
                    <input hidden value="${batch.batchId}" id="did" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" id="deleteB">Delete Batch</button>
            </form>
        </div>
    </div>
</div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
