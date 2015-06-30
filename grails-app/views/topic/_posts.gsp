<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
%{--${resourcesList}--}%
<g:each in="${resourcesList}" var="resourceList">
<div class="inner-container" style="border: 1px solid #000000;">
        <div>
            <div>
                <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
            </div>
            <ul>
                <li>${resourceList.topic.name}</li>
            </ul>
                <div>${resourceList.description}</div>
                <ul>
                    <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                    <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
                    <li class="navbar-form navbar-right"><g:link controller="resource" action="viewPost" id="${resourceList.id}">View Post</g:link></li>
                    <g:if test="${resourceList.readingitems.isRead[0] == true}">
                        <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${resourceList.id}" >Mark as unread</g:link></li>
                    </g:if> <g:elseif test="${resourceList.readingitems.isRead[0] ==  false || resourceList.readingitems.isRead[0] == null}">
                    <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${resourceList.id}" >Mark as Read</g:link></li>
                </g:elseif>
                    <g:if test="${resourceList.instanceOf(com.linksharing.LinkResource)}">
                        <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                    </g:if> <g:elseif test="${resourceList.instanceOf(com.linksharing.DocumentResource)}">
                    <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
                </g:elseif>
                </ul>
        </div>
</div>
</g:each>

