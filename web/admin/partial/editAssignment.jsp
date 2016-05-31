<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" tabindex="-1" role="dialog" id="editAssignment">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit Batch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="eAssginmentid">Assignment ID</label>
                        <input type="text" class="form-control" id="eAssignmentid" name="eAssignment"  maxlength="50" disabled value="${assignment.assignmentId}">
                    </div>
                    <div>
                        <label for="ebatch">Batch</label>
                        <select class="form-control" name="batchid" id="ebatch">
                            <option value="" selected="selected">Chose a batch</option>
                            <c:forEach var="b" items="${requestScope.lstb}">
                                <option value="${b.batchId}">${b.batchName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label for="esubject">Subject</label>
                        <select class="form-control" name="subjectid" id="esubject">
                            <option value="" selected="selected">Chose a subject</option>
                            <c:forEach var="s" items="${requestScope.lsts}">
                                <option value="${s.subjectId}">${s.subjectName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label for="eAssignmentname">Assignment Name</label>
                        <input type="text" class="form-control" maxlength="50" id="eAssignmentname" />
                    </div>
                    <br>
                    <div>
                        <div class="form-group date">
                            <label for="estart">Start date</label>
                            <div class='input-group date' >
                                <input type='text' class="form-control" id='estart' />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="form-group date">
                            <label for="eend">End date</label>
                            <div class='input-group date' >
                                <input type='text' class="form-control" id='eend' />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status">
                            <option value="1" selected class="form-control">Active</option>
                            <option value="2" class="form-control">Disable</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveAsm">Save Assignment</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () {
        $('#ebatch').combobox();
        $('#esubject').combobox();
        $('#estart').daterangepicker({
            singleDatePicker:true,
            timePicker: true,
            timePickerIncrement: 15,
            format: 'DD-MM-YYYY hh:mm A'
        });
        $('#eend').daterangepicker({
            singleDatePicker:true,
            timePicker: true,
            timePickerIncrement: 15,
            format: 'DD-MM-YYYY hh:mm A'
        });
    });
</script>