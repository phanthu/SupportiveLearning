<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" tabindex="-1" role="dialog" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit admin</h4>
                </div>
                <div class="modal-body">


                    <div class="form-group">
                        <label for="adminID">Admin ID</label>
                        <input type="text" class="form-control" id="eadminID" placeholder="Name" maxlength="50" disabled value="${admin.adminId}">
                    </div>
                    <div class="form-group">
                        <label for="adminName">Admin name</label>
                        <input type="text" class="form-control" id="eadminName" placeholder="Name" maxlength="50" value="${admin.adminName}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="epassword" placeholder="Password" maxlength="32" value="${admin.password}">
                    </div>
                    <div class="form-group">
                        <label for=repassword">Retype Password</label>
                        <input type="password" class="form-control" id="erepassword" placeholder="Password" maxlength="32">
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="estatus">
                            <c:if test="${admin.status == 1}">
                                <option value="1" class="form-control" selected>Active</option>
                                <option value="2" class="form-control">Disable</option>
                            </c:if>
                            <c:if test="${admin.status == 2}">
                                <option value="1" class="form-control">Active</option>
                                <option value="2" class="form-control" selected>Disable</option>
                            </c:if>

                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="saveAdmin">Save admin</button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
