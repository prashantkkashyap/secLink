<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<g:each in="${publicTopicResource}" var="publicTopicResources">
<div class="inner-container">
        <div>
            <div>
                <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
            </div>
                <div><g:link controller="topic" action="showTopic" id="${publicTopicResources.topic.id}">${publicTopicResources.topic.name}</g:link></div>
            <div>${publicTopicResources}</div>
            ${publicTopicResources.readingitems.isRead}
                <ul>
                    <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
                    <li class="navbar-form navbar-right"><g:link controller="resource" action="viewPost" id="${publicTopicResources.id}" >View Post</g:link></li>
                    <g:if test="${publicTopicResources.readingitems.isRead[0] == true}">
                        <li class="navbar-form navbar-right"><g:link controller="user" action="readingItem" id="${publicTopicResources.id}" >Mark as unread</g:link></li>
                    </g:if> <g:elseif test="${publicTopicResources.readingitems.isRead[0] ==  false || publicTopicResources.readingitems.isRead[0] == null}">
                        <li class="navbar-form navbar-right"><g:link controller="user" action="readingItem" id="${publicTopicResources.id}" >Mark as Read</g:link></li>
                    </g:elseif>
                    <g:if test="${publicTopicResources.instanceOf(com.linksharing.LinkResource)}">
                        <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                    </g:if> <g:elseif test="${publicTopicResources.instanceOf(com.linksharing.DocumentResource)}">
                        <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
                     </g:elseif>
                </ul>
        </div>
</div>
</g:each>

