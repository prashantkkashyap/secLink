<div class="container">
    <div class="modal" id="sendInvitationMailModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-envelope"></span>Send Invitations</h4>
                </div>
                <div class="modal-body">
                    <g:form id="form" name="form" controller="user" action="emailInvitation" >
                        <div class="form-group">
                            <lable for="email"><span class="glyphicon glyphicon-envelope"></span>Email* : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <input type="email" id="email" name="email" placeholder="Enter Email" required novalidate="novalidate"/>
                        </div>
                        <div class="form-group">
                            <lable for="topic"><span class="glyphicon glyphicon-pencil"></span>Topic Name* : </lable>
                            <g:select name="topic.id" from="${user?.topics.name}" value="${user?.topics.name}" keys="${user?.topics*.id}"
                                      noSelection="${['null':'Select One...']}"/>
                        </div>
                        <div class="modal-footer">
                            <ul>
                                <li class="btn pull-left" ><lable for="Send" ></lable><input   type="submit" value ='Send' /></li>
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

