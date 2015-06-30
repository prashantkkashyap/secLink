<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
%{--${unreadResources}--}%

<g:each in="${unreadResources}" var="unreadResource">

    <div class="inner-container" style="border:1px #000000 solid;" xmlns="http://www.w3.org/1999/html">
        <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
          <ul>
              <li>${unreadResource.createdBy.userName}</li>
              <li class="liStyle">@${unreadResource.createdBy.firstName}</li>
              <li>${unreadResource.dateCreated}</li>
              <li class="right"> <g:link controller="topic" action="showTopic" id="${unreadResource.topic.id}">${unreadResource.topic.name}</g:link></li>
          </ul>
        <ul>
            <li>${unreadResource.description}</li>
        </ul>
        <div><div>

             </div>
            <div></div>

            <ul>
                <li style="vertical-align: bottom;">
                    <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button"></div>
                    %{--<img  src="${resource(dir: 'images',file:'facebook.jpg')}">--}%
                </li>
                <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>
                <li class="navbar-form navbar-right" ><g:link controller="resource" action="viewPost" id="${unreadResource.id}">View Post</g:link></li>
                <li class="navbar-form navbar-right"><g:link controller="dashboard" action="readingItem" id="${unreadResource.id}">Mark as Read</g:link></li>
                <g:if test="${unreadResource.instanceOf(LinkResource)}">
                <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                </g:if> <g:elseif test="${unreadResource.instanceOf(DocumentResource)}">
                <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
            </g:elseif>
            </ul>
        </div>
    </div>
</g:each>
