<div class="container">
    <div class="modal" id="sendInvitationMailModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-envelope"></span>Send Invitations</h4>
                </div>
                <div class="modal-body">
                    <g:form  >
                        <div class="form-group">
                            <lable for="email"><span class="glyphicon glyphicon-envelope"></span>Email* : </lable>
                            <input type="email" class="form-control" value="${user?.email}" id="email" placeholder="Enter Email"/>
                        </div>
                        <div class="form-group">
                            <lable for="topic"><span class="glyphicon glyphicon-pencil"></span>Topic Name* : </lable>
                            <input type="text" class="form-control"  id="topic" placeholder="Topic Name"/>
                        </div>
                    </g:form>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">
                            <span class="glyphicon glyphicon-save" ></span> Save</button>
                        <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">
                            <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

%{--
<div id="invite" class="left">
    <div class="heading">Send Invitation</div>
    <div class="inner-container">
        <g:form action="loginHandler">
            <div class="line">
                <lable for="email">Email*:&nbsp;&nbsp;</lable>
                <input type="email" id="email" name="email"/>
            </div>
            <div class="line">
                <lable for="topic">Topic*:&nbsp;&nbsp;</lable>
                <input type="topic" id="topic" name="topic"/>
            </div>
            <div>
                <ul>
                <li><lable for="invite">
                </lable><input type="submit" value ='Invite' />
                </li>
                <li><lable for="cancel">
                </lable><input type="submit" value ='Cancel' />
                </li>
                </ul>
            </div>
        </g:form>
    </div>
</div>--}%

