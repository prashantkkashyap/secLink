<%@ page import="com.linksharing.ReadingItem; com.linksharing.DocumentResource; com.linksharing.LinkResource" %>

<div class="heading" >
    <span style="margin: 2% 0% 0% 5%; border: 1px dotted #000000;">Posts: ${topicResourceList.topic.name[0]}</span>
        <div class="right" style=" margin-right:2.5%;width: 60%; vertical-align: middle;">
            <g:form controller="search" action="postSearch" class="navbar-form navbar-right">
                <div class="form-group">
                    <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                    <input type="hidden" name="topicId" value="${topicResourceList.topic.id[0]}">
                    <g:submitButton name="search"></g:submitButton>
                </div>
            </g:form>
        </div>
</div>
<g:each in="${topicResourceList}" var="topicResourceLists">
    <div class="inner-container" style="border:1px #000000 solid;">
        <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
        <div>${topicResourceLists.description}</div>
        <ul>
            <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
            <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
            <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
            <li class="navbar-form navbar-right"><g:link controller="resource" action="viewPost" id="${topicResourceLists.id}">View Post</g:link></li>
            <g:if test="${topicResourceLists.readingitems.isRead[0] == true}">
                <li class="navbar-form navbar-right"><g:link controller="readingItem" action="unreadingItem" id="${topicResourceLists.id}" >Mark as unread</g:link></li>
            </g:if> <g:elseif test="${topicResourceLists.readingitems.isRead[0] ==  false || topicResourceLists.readingitems.isRead[0] == null}">
            <li class="navbar-form navbar-right"><g:link controller="readingItem" action="readingItem" id="${topicResourceLists.id}" >Mark as Read</g:link></li>
        </g:elseif>
            <g:if test="${topicResourceLists.instanceOf(com.linksharing.LinkResource)}">
                <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
            </g:if> <g:elseif test="${topicResourceLists.instanceOf(com.linksharing.DocumentResource)}">
            <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
            </g:elseif>
        </ul>
    </div>
    </g:each>

