<div class="container">
    <div class="modal" id="secSwitchUserModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-user"></span>Switch User</h4>
                </div>
                <div class="modal-body">
                   %{-- ${flash.message}
                    <g:if test="${session["user"]}">
                        </br>
                            Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                    </g:if>
                    <g:else>--}%
                    <sec:ifAllGranted roles='ROLE_SWITCH_USER'>
                        <form action='/j_spring_security_switch_user' method='POST'>
                            Switch to user: <input type='text' name='j_username' required novalidate="novalidate"/> <br/>
                            <div class="modal-footer">
                                <ul>
                                    <li class="btn pull-left" ><lable for="save" ></lable><input   type="submit" value ='Switch' /></li>
                                    <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                                </ul>
                            </div>
                        </form>
                    </sec:ifAllGranted>
                        %{--<g:form id="form" name="form">
                            <div class="form-group">
                                <lable for="name">Name*:&nbsp;&nbsp;</lable>
                                    <input name="name" id="name" required novalidate="novalidate"/>
                            </div>
                            <div class="modal-footer">
                                <ul>
                                    <li class="btn pull-left" ><lable for="save" ></lable><input   type="submit" value ='Submit' /></li>
                                    <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                                </ul>
                            </div>
                        </g:form>--}%

                   %{-- </g:else>--}%
                </div>
            </div>
        </div>
    </div>
</div>