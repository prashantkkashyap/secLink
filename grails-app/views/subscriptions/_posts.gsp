<%@ page import="com.linksharing.ReadingItem; com.linksharing.DocumentResource; com.linksharing.LinkResource" %>

<g:each in="${topicResourceList}" var="topicResourceLists">
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%
            <img src="${resource(dir: 'images',file: "/userImage/${topicResourceLists.createdBy.userName}")}" />
        </div>
        <div>${topicResourceLists.description}</div>
        <ul>
            <li style="vertical-align: bottom;">
                <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button"></div>
            </li>
            <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
            <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
            <li class="navbar-form navbar-right"><g:link controller="resource" action="viewPost" id="${topicResourceLists.id}">View Post</g:link></li>
            <g:if test="${topicResourceLists.readingitems.isRead[0] == true}">
                <li class="navbar-form navbar-right">
                    <a id="${topicResourceLists.id}" class="readAndUnread" style="cursor: pointer" >Mark as unread</a>
                </li>
            </g:if> <g:elseif test="${topicResourceLists.readingitems.isRead[0] ==  false || topicResourceLists.readingitems.isRead[0] == null}">
            <li class="navbar-form navbar-right">
                <a id="${topicResourceLists.id}" class="readAndUnread" style="cursor: pointer">Mark as Read</a>
            </li>
        </g:elseif>
            <g:if test="${topicResourceLists.instanceOf(com.linksharing.LinkResource)}">
                <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
            </g:if> <g:elseif test="${topicResourceLists.instanceOf(com.linksharing.DocumentResource)}">
            <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
            </g:elseif>
        </ul>
    </div>
    </g:each>

