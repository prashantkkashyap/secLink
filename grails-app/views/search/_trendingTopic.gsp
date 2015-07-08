<g:each in="${subscribedList}" var="subscirbedTopics">
    <div class="heading" >
        <div class="right" style=" margin-right: 2%; width: 60%; ">
            <g:form controller="search" action="topicSearch" class="navbar-form navbar-right">
                <div class="form-group">
                    <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                    %{-- <input type="hidden" name="topicId" value="${subscirbedTopics.id}">--}%
                    <g:submitButton name="search"></g:submitButton>
                </div>
            </g:form>
        </div>
        <div style="margin: 2% 0% 0% 2%; vertical-align: middle; width: 40%;">Topics: ${subscirbedTopics.name}</div>

    </div>
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%
            <img src="${resource(dir: 'images',file: "/userImage/${subscirbedTopics.createdBy.userName}")}" />
        </div>
        <div>
            <ul style="margin-top: 2%;">
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
                <li>
                    <a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                        <img src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/>
                    </a>
                </li>
            </ul>
        </div>
        <div style="margin:2% 0 0 2%;border-top:1px #000000 solid; ">
            <div style="margin: 2%; ">
                    %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                        <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
                    </g:if>--}%
                    <img src="${resource(dir: 'images',file: "/userImage/${subscirbedTopics.createdBy.userName}")}" />
            </div>
            <div>
                <div class="editTopicDiv" style="display: none;">
                <form class="form-group" >
                    <g:textField name="name" style="background-color: greenyellow;" controller="topic" value="${subscirbedTopics.name}" action="updateTopicName" id="${subscirbedTopics.id}">${subscirbedTopics.name}</g:textField>
                    <g:submitButton  name="save" value="Save"> </g:submitButton>
                </form>
                </div>
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
                        <g:if test="${subscirbedTopics.createdBy.id == user.id ||  user.admin == true}">
                            <a data-toggle="modal" class="editDiv" href="javascript:">
                                <img src="${resource(dir:'images',file:'edit.png')}"/>
                            </a>
                        </g:if>
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