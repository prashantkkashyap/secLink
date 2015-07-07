<%@ page import="com.linksharing.Topic; com.linksharing.Subscription" %>

<g:each in="${listTopicPost}" var="listTopic">
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            %{--<g:if test="${user.photo ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%

            <img src="${resource(dir: 'images',file: "/userImage/${listTopic.createdBy.userName}")}" />
        </div>
        <div>
            <ul>
                <li>${listTopic.createdBy.userName}</li>
                <li class="right"><g:link controller="topic" action="showTopic" id="${listTopic.id}">${listTopic.name}</g:link></li>
            </ul>
        </div>

            <g:each in="${listTopic.resources}"var="listResource">
                <div style="border:1px dotted #000000;margin: 1.5%; padding: 1%;" >
                    <div>${listResource.description}</div>
                    <ul>
                        <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
                        <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                        <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
                        <li class="navbar-form navbar-right" ><g:link controller="resource" action="viewPost" id="${listResource.id}">View Post</g:link></li>
                        <g:if test="${listResource.readingitems.isRead[0] == true}">
                            <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${listResource.id}" >Mark as unread</g:link></li>
                        </g:if> <g:elseif test="${listResource.readingitems.isRead[0] ==  false || listResource.readingitems.isRead[0] == null}">
                            <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${listResource.id}" >Mark as Read</g:link></li>
                         </g:elseif>
                        <g:if test="${listResource.instanceOf(com.linksharing.LinkResource)}">
                            <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                        </g:if> <g:elseif test="${listResource.instanceOf(com.linksharing.DocumentResource)}">
                        <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
                    </g:elseif>
                    </ul>
                </div>
            </g:each>

    </div>
</g:each>
    %{--<div class="inner-container" style="border: 1px solid #000000;">
        <div>
            <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
        </div>
        <div>
            <ul>
                <li>${listTopic.name} (${listTopic.visibility})</li>
            </ul>
            <ul>
                <li>${listTopic.createdBy.userName}</li>
                <li><a data-toggle="modal" title="Send Invitation" class="sendInvitationDiv" href="javascript:"><img src="${resource(dir: 'images', file:'mail.png')}" /></a></li>
                </ul>
            <ul>
                <li>Subscriptions</li>
                <li>Topics</li>
            </ul>
            <ul>
                --}%%{--<g:if test="${listTopic.instanceOf(Subscription)!=Topic.instanceOf(Subscription)}">
                <li><g:link>Subscribe</g:link></li>
                </g:if>--}%%{--
                <li class="liStyle">${listTopic.subscriptions.size()}</li>
                <li class="liStyle"><appTag:totalTopicsCreatedByUser></appTag:totalTopicsCreatedByUser></li>
            </ul>
            <ul>
               --}%%{-- <li>
                    <div class="line">
                        <g:form name='visibility' controller="topic"  id="${listTopic.id}" action="topicVisibility">
                            <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${listTopic.visibility}"/>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </div>
                </li>--}%%{--

            </ul>
        </div>
    </div>--}%