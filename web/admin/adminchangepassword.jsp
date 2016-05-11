        <div class="modal fade" tabindex="-1" role="dialog" id="modalchangePassword">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Change Password</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="adminName">Old Password</label>
                        <input type="Password" class="form-control" id="adminName" placeholder="Name" maxlength="50">
                    </div>
                    <div class="form-group">
                        <label for="password">New Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password" maxlength="32">
                    </div>
                    <div class="form-group">
                        <label for=repassword">Retype Password</label>
                        <input type="password" class="form-control" id="repassword" placeholder="Password" maxlength="32">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="createAdmin">Change Password</button>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
