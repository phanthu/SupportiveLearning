<div class="modal fade" tabindex="-1" role="dialog" id="deleteStudent">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Delete Student</h4>
                </div>
                <div class="modal-body">
                    Delete student ${student.studentName} ?
                    <input hidden value="${student.studentId}" id="did" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" id="deleteStu">Delete Student</button>
            </form>
        </div>
    </div>
</div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
