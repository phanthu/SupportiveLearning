<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" tabindex="-1" role="dialog" id="editStudent">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit Student</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="studentId">Student ID</label>
                        <input type="text" class="form-control" id="estudentId" name="studentId"  maxlength="50" disabled value="${student.studentId}">
                    </div>
                    <div class="form-group">
                        <label for="studentName">Student name</label>
                        <input type="text" class="form-control" id="estudentName" name="studentName" placeholder="Name" maxlength="50" required value="${student.studentName}">
                    </div>
                    <div class="form-group">
                        <label for="studentPass">Student Password</label>
                        <input type="text" class="form-control" id="estudentPass" name="studentPass" placeholder="Password" maxlength="32" required value="${student.password}">
                    </div>
                    <div class="form-group">
                        <label for="batch">Batch</label>
                        <select name="batch" class="form-control" id="batch">
                            <option value="0" selected> None </option>
                            <c:forEach var="batch" items="${requestScope.lstb}">
                                <option  value="${batch.batchId}" > ${batch.batchName} </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveStu">Save Student</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
