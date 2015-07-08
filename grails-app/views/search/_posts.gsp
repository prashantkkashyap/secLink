<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<g:each in="${topPosts}" var="topPost">
<div class="inner-container" style="border:1px #000000 solid;">
    <div>
        %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%
        <img src="${resource(dir: 'images',file: "/userImage/${topPost.createdBy.userName}")}" />
    </div>
    <div>${topPost.description}</div>
    ${topPost.id.class}
    <ul>
        <li style="vertical-align: bottom;">
            <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button"></div>
            %{--<img  src="${resource(dir: 'images',file:'facebook.jpg')}">--}%
        </li>
        <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
        <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
        <li class="navbar-form navbar-right" ><g:link controller="resource" action="viewPost" id="${topPost.id}">View Post</g:link></li>
        <g:if test="${topPost.readingitems.isRead[0] == true}">
            <li class="navbar-form navbar-right">
                <a id="${topPost.id}" class="readAndUnread" style="cursor: pointer" >Mark as unread</a>
            </li>
        </g:if> <g:elseif test="${topPost.readingitems.isRead[0] ==  false || topPost.readingitems.isRead[0] == null}">
        <li class="navbar-form navbar-right">
            <a id="${topPost.id}" class="readAndUnread" style="cursor: pointer">Mark as Read</a>
        </li>
        </g:elseif>
        %{--<g:if test="${topPost.readingitems.isRead[0] == true}">
        <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${topPost.id}" >Mark as unread</g:link></li>
        </g:if> <g:elseif test="${topPost.readingitems.isRead[0] ==  false || topPost.readingitems.isRead[0] == null}">
        <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${topPost.id}" >Mark as Read</g:link></li>
        </g:elseif>--}%
        <g:if test="${topPost.instanceOf(com.linksharing.LinkResource)}">
            <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
        </g:if> <g:elseif test="${topPost.instanceOf(com.linksharing.DocumentResource)}">
            <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
         </g:elseif>
    </ul>
</div>
</g:each>
