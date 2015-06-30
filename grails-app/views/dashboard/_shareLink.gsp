<div class="container">
    <div class="modal" id="shareLinkModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-link"></span>Share Link</h4>
                </div>
                <div class="modal-body">
                    <g:form controller="linkResource" action="shareLinkResource">
                        <div class="form-group">
                            <lable for="url" >Link*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <g:textField name="url"></g:textField>
                        </div>
                        <div class="form-group">
                            <lable for="description">Description*:&nbsp;&nbsp;</lable>
                            <g:textArea name="description" rows="7" cols="50"></g:textArea>
                        </div>
                        <div class="form-group">
                            <lable for="topic">Topic*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <g:select name="topic.id" from="${user?.topics.name}" value="${user?.topics.name}" keys="${user?.topics*.id}"
                                      noSelection="${['null':'Select One...']}"/>
                                %{--<select name="topic" for="topic">
                                <g:each in="${userTopicsLinkShare}" var="shareLinkTopic">
                                <option>"${shareLinkTopic}"</option>
                                </g:each>
                            </select>--}%
                        </div>
                        %{--<div class="modal-footer">
                            <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-share"></span>Share</button>
                            <button class="btn btn-default btn-default pull-right" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        </div>--}%
                        <div class="modal-footer">
                            <ul>
                                <li class="btn pull-left"><lable for="submit"></lable><input  class="glyphicon glyphicon-share" type="submit" value ='Share' /></li>
                                <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal" class="glyphicon glyphicon-remove" type="submit" value ='Cancel' /></li>
                            </ul>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>