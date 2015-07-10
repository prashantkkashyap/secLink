<div class="container">
    <div class="modal" id="sendResetPasswordModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-envelope"></span>Reset Password</h4>
                </div>
                <div class="modal-body">
                    <g:form controller="login" action="resetPassword">
                        <div class="form-group">
                            <lable for="email"><span class="glyphicon glyphicon-envelope"></span>Email* : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <input type="email" id="email" name="email" placeholder="Enter Email"/>
                        </div>
                        <div class="modal-footer">
                            <ul>
                                <li class="btn pull-left" ><lable for="submit" ></lable><input   type="submit" value ='Submit' /></li>
                                <li class="btn pul-right"><lable for="Cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                            </ul>
                        </div>
                    %{-- <div class="modal-footer">
                         <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">
                             <span class="glyphicon glyphicon-save" ></span> Send</button>
                         <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">
                             <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                     </div>--}%
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>

