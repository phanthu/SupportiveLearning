<div class="modal fade" tabindex="-1" role="dialog" id="createModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add admin</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="adminName">Admin name</label>
                        <input type="text" class="form-control" id="adminName" name="adminName" placeholder="Name" maxlength="50" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" maxlength="32" required>
                    </div>
                    <div class="form-group">
                        <label for=repassword">Retype Password</label>
                        <input type="password" class="form-control" id="repassword" placeholder="Password" maxlength="32" required>
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
                    <button type="button" class="btn btn-primary" id="createAdmin">Create admin</button>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->