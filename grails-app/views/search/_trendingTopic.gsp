
<g:each in="${trendingTopicList}" var="trendingTopic">
    %{--<div class="heading" >
        <div class="right" style=" margin-right: 2%; width: 60%; ">
            <g:form controller="search" action="topicSearch" class="navbar-form navbar-right">
                <div class="form-group">
                    <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                    --}%%{-- <input type="hidden" name="topicId" value="${subscirbedTopics.id}">--}%%{--
                    <g:submitButton name="search"></g:submitButton>
                </div>
            </g:form>
        </div>
        <div style="margin: 2% 0% 0% 2%; vertical-align: middle; width: 40%;">Topics: ${trendingTopic[0].name}</div>

    </div>--}%
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%
            <img src="${resource(dir: 'images',file: "/userImage/${trendingTopic[0].createdBy.userName}")}" />
        </div>
        <div>
            <ul style="margin-top: 2%;">
                <li><g:link controller="subscriptions" action="subscribedTopics" id="${trendingTopic[0].id}">${trendingTopic[0].name} </g:link>%{--(${trendingTopic[0].visibility})--}%</li>
            </ul>

            <ul>
                <li>${trendingTopic[0].createdBy.userName}</li>
                </ul>
            <ul>
                <li >Subscriptions</li>
                <li>Topics</li>
            </ul>
            <ul>
                <li class="liStyle">${trendingTopic[0].subscriptions.size()}</li>
                <li class="liStyle">${user.topics.size()}</li>
            </ul>
            <ul>
                <li>
                    <div>
                        <g:form id="${trendingTopic[0].subscriptions.id}" controller="subscriptions" action="seriousness">
                            <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${trendingTopic[0].subscriptions.seriousness[0]}"></g:select>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </div>
                </li>
                <li>
                    <a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                        <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>
                </li>
            </ul>
        </div>
        <div style="margin:2% 0 0 2%;border-top:1px #000000 solid; ">
            <div style="margin: 2%; ">
                    %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                        <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
                    </g:if>--}%
                    <img src="${resource(dir: 'images',file: "/userImage/${trendingTopic[0].createdBy.userName}")}" />
            </div>
            <div>
                <div class="editTopicDiv" style="display: none;">
                <form class="form-group" >
                    <g:textField name="name" style="background-color: greenyellow;" controller="topic" value="${trendingTopic[0].name}" action="updateTopicName" id="${trendingTopic[0].id}">${trendingTopic[0].name}</g:textField>
                    <g:submitButton  name="save" value="Save"> </g:submitButton>
                </form>
                </div>
                <ul>${trendingTopic[0].createdBy.firstName}</ul>
                <ul>
                    <li>Subscriptions</li>
                    <li>Post</li>
                </ul>
                <ul>
                    <li class="liStyle">${trendingTopic[0].subscriptions.size()}</li>
                    <li class="liStyle">${trendingTopic[0].resources.size()}</li>
                </ul>
                <ul>
                    <li>
                        <div>
                            <g:form id="${trendingTopic[0].subscriptions.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${trendingTopic[0].subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                    <li>
                        <div class="line">
                            <g:form name='visibility' controller="topic"  id="${trendingTopic[0].id}" action="topicVisibility">
                                <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${trendingTopic[0].visibility}"/>
                                   <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                </li>
                    <li>%{--<a data-toggle="modal" class="subscribeSendInvitationsModalDiv" href="javascript:void (0)">
                        <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>--}%
                    </li>
                    <li>
                        <g:if test="${trendingTopic[0].createdBy.id == user.id ||  user.admin == true}">
                            <a data-toggle="modal" class="editDiv" href="javascript:">
                                <img src="${resource(dir:'images',file:'edit.png')}"/>
                            </a>
                        </g:if>
                    </li>
                    <li>
                    %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
                        <g:link controller="topic" action="topicDelete" id="${trendingTopic[0].id}">
                            <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                        </g:link>
                    %{-- </a>--}%
                    </li>
                </ul>
            </div>
        </div>
    </div>
</g:each>