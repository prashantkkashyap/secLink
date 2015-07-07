<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<g:each in="${postSearchList}" var="postSearch">
<div class="inner-container">
        <div>
            %{--<div>
                <img src="${resource(dir:'images', file: "/userImage/${publicTopicResources.createdBy.userName}")}"/>
            </div>--}%
                <div><g:link controller="topic" action="showTopic" id="${postSearch.topic.id}">${postSearch.topic.name}</g:link></div>
            <div style="margin-top:2%; ">${postSearch}</div>
            %{--${publicTopicResources.readingitems.isRead}--}%
            <div style="margin-top:2%;">
                <ul>
                    <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
                    <li class="navbar-form navbar-right"><g:link controller="resource" action="viewPost" id="${postSearch.id}" >View Post</g:link></li>
                    <g:if test="${postSearch.readingitems.isRead[0] == true}">
                        <li class="navbar-form navbar-right"><g:link controller="user" action="readingItem" id="${postSearch.id}" >Mark as unread</g:link></li>
                    </g:if> <g:elseif test="${postSearch.readingitems.isRead[0] ==  false || postSearch.readingitems.isRead[0] == null}">
                        <li class="navbar-form navbar-right"><g:link controller="user" action="readingItem" id="${postSearch.id}" >Mark as Read</g:link></li>
                    </g:elseif>
                    <g:if test="${postSearch.instanceOf(com.linksharing.LinkResource)}">
                        <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                    </g:if> <g:elseif test="${postSearch.instanceOf(com.linksharing.DocumentResource)}">
                        <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
                     </g:elseif>
                </ul>
        </div>
        </div>
</div>
</g:each>

