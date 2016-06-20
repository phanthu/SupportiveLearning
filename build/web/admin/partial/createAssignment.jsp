<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" tabindex="-1" role="dialog" id="createAssignment">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Assignment</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <label for="cbatch">Batch</label>
                        <select class="form-control" name="batchid" id="cbatch">
                            <option value="" selected="selected">Chose a batch</option>
                            <c:forEach var="b" items="${requestScope.lstb}">
                                <option value="${b.batchId}">${b.batchName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label for="csubject">Subject</label>
                        <select class="form-control" name="subjectid" id="csubject">
                            <option value="" selected="selected">Chose a subject</option>
                            <c:forEach var="s" items="${requestScope.lsts}">
                                <option value="${s.subjectId}">${s.subjectName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label for="cAssignmentname">Assignment Name</label>
                        <input type="text" class="form-control" maxlength="50" id="cAssignmentname" />
                    </div>
                    <br>
                    <div>
                        <label for="ctime">Startime and Endtime</label>
                        <div class='input-group date' >
                            <input type='text' class="form-control" id='ctime' />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <br>
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
                    <button type="button" class="btn btn-primary" id="createasm">Create Assignment</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(document).ready(function () {
        $('#cbatch').combobox();
        $('#csubject').combobox();
        $('#ctime').daterangepicker({
            timePicker:true,
            timePickerIncrement:15,
            format:'DD-MM-YYYY HH:mm:ss'
        });
    });
</script>
