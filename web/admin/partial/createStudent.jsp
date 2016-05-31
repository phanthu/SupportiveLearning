<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" tabindex="-1" role="dialog" id="createStudent">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Student</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="studentName">Student name</label>
                        <input type="text" class="form-control" id="studentName" name="studentName" placeholder="Name" maxlength="50" required>
                    </div>
                    <div class="form-group">
                        <label for="studentPass">Student Password</label>
                        <input type="text" class="form-control" id="studentPass" name="studentPass" placeholder="Password" maxlength="32" required>
                    </div>
                    <div class="form-group">
                        <label for="cbatch">Batch</label>
                        <select name="cbatch" class="form-control combobox" id="cbatch">
                            <option value="" selected="selected">Chose a batch</option>
                            <option value="0" class="form-control" selected="selected">None</option>
                            <c:forEach var="batch" items="${requestScope.lstb}">
                                <option  value="${batch.batchId}">${batch.batchName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="createStu">Create Student</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#cbatch').combobox();
    });

</script>