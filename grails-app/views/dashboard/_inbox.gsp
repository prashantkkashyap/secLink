<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
%{--${unreadResources}--}%

<g:each in="${unreadResources}" var="unreadResource">

    <div class="inner-container" style="border:1px #000000 solid;" xmlns="http://www.w3.org/1999/html">
        <div>
            %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%
            <img src="${resource(dir: 'images',file: "/userImage/${unreadResource.createdBy.username}")}" />
        </div>
          <ul>
              <li>${unreadResource.createdBy.username}</li>
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
                %{--<li style="vertical-align: bottom;">
                    <div class="fb-share-button" data-href="https://www.facebook.com/sharer/sharer.php?u=URLENCODED_URL&t=TITLE" data-layout="button"></div>
                    --}%%{--<img  src="${resource(dir: 'images',file:'facebook.jpg')}">--}%%{--
                </li>--}%

                <li>
                <a id="shareFB" href="https://www.facebook.com/sharer/sharer.php?u=URLENCODED_URL&t=TITLE"
                   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                   target="_blank" title="Share on Facebook">
                    <span ><img style="width: auto;" src="${resource(dir: 'images',file:'facebook.png')}"></span></a>
                <script type="text/javascript">document.getElementById("shareFB").setAttribute("href", "https://www.facebook.com/sharer/sharer.php?u=" + document.URL);</script>
                </li>
                <li>
                <div class="btn-o" data-scribe="component:button" style="width: 55px ;">
                    <a target="_blank" href="https://twitter.com/intent/tweet?original_referer= "class=btn">
                        <i></i>
                        <span ><img style=";" src="${resource(dir: 'images',file:'twitter.jpg')}"></span>
                    </a>
                </div>
                </li>
                <li>
                    <a href="https://plus.google.com/share?url=URLENCODED_URL"
                       onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=480');return false;"
                       target="_blank" title="Share on Google+">
                        <span ><img style="width: auto;" src="${resource(dir: 'images',file:'gplus.png')}"></span>
                    </a>
                </li>
               %{-- <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>--}%
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
