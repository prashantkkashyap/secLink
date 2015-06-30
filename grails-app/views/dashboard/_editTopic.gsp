<div class="container" >
    <div class="modal" id="editTopicModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-pencil"></span>Update Topic</h4>
                </div>
                <div class="modal-body">
                %{-- ${flash.message}
                 <g:if test="${session["user"]}">
                     </br>
                         Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                 </g:if>
                 <g:else>--}%
                    <g:form controller="topic" action="updateTopicName" id="${totalSubscriptionUserTopic.id}">
                        <div class="form-group">
                            <lable for="name">Name*:&nbsp;&nbsp;</lable>
                            <g:textField name="name" id="name" value="${totalSubscriptionUserTopic.name}"></g:textField>
                        </div>
                        <div class="line">
                            <g:form name='visibility' controller="topic"  id="${totalSubscriptionUserTopic.id}" action="topicVisibility">
                                <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${totalSubscriptionUserTopic.visibility}"/>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                        <div>
                            <g:form id="${totalSubscriptionUserTopic.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${totalSubscriptionUserTopic.subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
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