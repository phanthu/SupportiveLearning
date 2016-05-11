<div class="modal fade" tabindex="-1" role="dialog" id="editSubject">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit Subject</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="subjectId">Subject ID</label>
                        <input type="text" class="form-control" id="esubjectId" name="subjectId"  maxlength="50" disabled value="${subject.subjectId}">
                    </div>
                    <div class="form-group">
                        <label for="subjectName">Subject name</label>
                        <input type="text" class="form-control" id="esubjectName" name="subjectName"  maxlength="50" value="${subject.subjectName}">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveS">Save Subject</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->