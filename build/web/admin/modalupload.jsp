<div class="modal fade" tabindex="-1" role="dialog" id="modalupload" action="uploadassignment">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="fileform">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">${assignment.assignmentName}</h4>
                </div>
                <div class="modal-body">
                    <input type="file" id="fileupload" class="filestyle" data-buttonName="btn-info" data-buttonBefore="true">
                    <input type="hidden" id="uploadid" value="${assignment.assignmentId}" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="beginupload" assignment_id="${assignment.assignmentId}">Upload file</button>
                </div>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="resources/js/bootstrap-filestyle.min.js" type="text/javascript"></script>