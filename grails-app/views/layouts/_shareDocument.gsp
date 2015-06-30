<div class="container">
    <div class="modal" id="shareDocumentModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-link"></span>Share Document</h4>
                </div>
                <div class="modal-body">
                    <g:form controller="documentResource" action="shareDocumentResource">
                        <div class="form-group">
                            <lable for="fileName">Document*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <g:textField name="fileName"></g:textField>
                            <input type="file" name="fileName" />
                        </div>
                        <div class="form-group">
                            <lable for="description">Description*:&nbsp;&nbsp;</lable>
                            <g:textArea name="description" rows="7" cols="50"></g:textArea>
                        </div>
                        <div class="form-group">
                            <lable for="topic">Topic*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lable>
                            <g:select name="topic.id" multiple="false" from="${user?.topics.name}" value="${user?.topics.name}" keys="${user?.topics*.id}"
                                      noSelection="${['null':'Select One...']}"/>
                            %{--<select name="topic" for="topic">
                            <g:each in="${userTopicsLinkShare}" var="shareLinkTopic">
                            <option>"${shareLinkTopic}"</option>
                            </g:each>
                        </select>--}%
                        </div>
                        %{--<div class="modal-footer">
                            <button type="submit"  class="btn btn-default btn-default pull-left" data-dismiss="modal">
                                <span class="glyphicon glyphicon-share"></span> Share</button>
                            <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">
                                <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        </div>--}%
                        <div class="modal-footer">
                            <ul>
                                <li class="btn pull-left" ><lable for="share" ></lable><input   type="submit" value ='Share' /></li>
                                <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                            </ul>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>