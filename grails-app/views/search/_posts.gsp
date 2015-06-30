<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<g:each in="${topPosts}" var="topPost">
<div class="inner-container" style="border:1px #000000 solid;">
    <div>
        <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
    </div>
    <div>${topPost.description}</div>
    <ul>
        <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
        <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
        <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
        <li class="navbar-form navbar-right" ><g:link controller="resource" action="viewPost" id="${topPost.id}">View Post</g:link></li>
        <g:if test="${topPost.readingitems.isRead[0] == true}">
        <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${topPost.id}" >Mark as unread</g:link></li>
        </g:if> <g:elseif test="${topPost.readingitems.isRead[0] ==  false || topPost.readingitems.isRead[0] == null}">
        <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${topPost.id}" >Mark as Read</g:link></li>
    </g:elseif>
        <g:if test="${topPost.instanceOf(com.linksharing.LinkResource)}">
            <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
        </g:if> <g:elseif test="${topPost.instanceOf(com.linksharing.DocumentResource)}">
            <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
         </g:elseif>
    </ul>
</div>
</g:each>
