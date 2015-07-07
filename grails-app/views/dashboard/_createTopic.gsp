<div class="container">
    <div class="modal" id="createTopicModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-pencil"></span>Create Topic</h4>
                </div>
                <div class="modal-body">
                   %{-- ${flash.message}
                    <g:if test="${session["user"]}">
                        </br>
                            Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                    </g:if>
                    <g:else>--}%
                        <g:form controller="topic" action="createTopicAndSubscribeCreator">
                            <div class="form-group">
                                <lable for="name">Name*:&nbsp;&nbsp;</lable>
                                    <g:textField name="name" id="name"></g:textField>
                            </div>
                            <div class="form-group">
                                <lable for="visibility" name="visibility" >Visibility*:&nbsp;&nbsp;</lable>
                                    <select name="visibility" id="visibility">
                                        <option value="${com.Visibility.PUBLIC}">Public</option>
                                        <option value="${com.Visibility.PRIVATE}">Private</option>
                                    </select>
                            </div>

                               %{-- <div class="modal-footer">
                                    <button type="submit" value="save" class="btn btn-default btn-default pull-left" data-dismiss="modal" >
                                        <span class="glyphicon glyphicon-save"></span> Save</button>
                                    <button value="cancel" class="btn btn-default btn-default pull-right" data-dismiss="modal">
                                        <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                                </div>--}%
                            <div class="modal-footer">
                                <ul>
                                    <li class="btn pull-left" ><lable for="save" ></lable><input   type="submit" value ='Save' /></li>
                                    <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                                </ul>
                            </div>
                        </g:form>

                   %{-- </g:else>--}%
                </div>
            </div>
        </div>
    </div>
</div>