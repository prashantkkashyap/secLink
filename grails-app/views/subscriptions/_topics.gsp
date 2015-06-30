<g:each in="${subscribedList}" var="subscirbedTopics">
    <div class="heading" >
        <span style="margin: 2% 0% 0% 5%; border: 1px dotted #000000;">Topics: ${subscirbedTopics.name}</span>
        <div class="right" style=" margin-right:2.5%;width: 60%; vertical-align: middle;">
            <g:form controller="search" action="topicSearch" class="navbar-form navbar-right">
                <div class="form-group">
                    <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                   %{-- <input type="hidden" name="topicId" value="${subscirbedTopics.id}">--}%
                    <g:submitButton name="search"></g:submitButton>
                </div>
            </g:form>
        </div>
    </div>
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
         </div>
        <div>
            <ul>
                <li><g:link controller="subscriptions" action="subscribedTopics" id="${subscirbedTopics.id}">${subscirbedTopics.name} </g:link>(${subscirbedTopics.visibility})</li>
            </ul>

            <ul>
                <li>${subscirbedTopics.createdBy.userName}</li>
                </ul>
            <ul>
                <li >Subscriptions</li>
                <li>Topics</li>
            </ul>
            <ul>
                <li class="liStyle">${subscirbedTopics.subscriptions.size()}</li>
                <li class="liStyle">${user.topics.size()}</li>
            </ul>
            <ul>
                <li>
                    <div>
                        <g:form id="${subscirbedTopics.subscriptions.id}" controller="subscriptions" action="seriousness">
                            <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${subscirbedTopics.subscriptions.seriousness[0]}"></g:select>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </div>
                </li>
                <li><a data-toggle="modal" title="Send Invitation" class="sendInvitationDiv" href="javascript:"><img src="${resource(dir: 'images', file:'mail.png')}" /></a></li>
            </ul>
        </div>
        <div style="margin-left:2%; ">
            <div style="border-top:1px #000000 solid;margin-bottom: 2%; ">
                <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
            </div>
            <div>
                <form class="form-group">
                    <g:textField name="name" style="visibility: visible;background-color: greenyellow;" controller="topic" value="${subscirbedTopics.name}" action="updateTopicName" id="${subscirbedTopics.id}">${subscirbedTopics.name}</g:textField>
                    <g:submitButton name="save" value="Save"> </g:submitButton>
                </form>
                <ul>${subscirbedTopics.createdBy.firstName}</ul>
                <ul>
                    <li>Subscriptions</li>
                    <li>Post</li>
                </ul>
                <ul>
                    <li class="liStyle">${subscirbedTopics.subscriptions.size()}</li>
                    <li class="liStyle">${subscirbedTopics.resources.size()}</li>
                </ul>
                <ul>
                    <li>
                        <div>
                            <g:form id="${subscirbedTopics.subscriptions.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${subscirbedTopics.subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                    <li>
                        <div class="line">
                            <g:form name='visibility' controller="topic"  id="${subscirbedTopics.id}" action="topicVisibility">
                                <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${subscirbedTopics.visibility}"/>
                                   <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                </li>
                    <li>%{--<a data-toggle="modal" class="subscribeSendInvitationsModalDiv" href="javascript:void (0)">
                        <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>--}%
                    </li>
                    <li>
                        <a data-toggle="modal" href="javascript:void(0)" class="editTopic" >
                            <img src="${resource(dir:'images',file:'edit.png')}"/>
                        </a>
                    </li>
                    <li>
                    %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
                        <g:link controller="topic" action="topicDelete" id="${subscirbedTopics.id}">
                            <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                        </g:link>
                    %{-- </a>--}%
                    </li>
                </ul>
            </div>
        </div>
    </div>
</g:each>