<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<g:each in="${topPosts}" var="topPost">
<div class="inner-container" style="border:1px #000000 solid;">
    <div>
        %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%
        <img src="${resource(dir: 'images',file: "/userImage/${topPost.createdBy.username}")}" />
    </div>
    <div>${topPost.description}</div>
    ${topPost.id.class}
    <ul>
        %{--<li style="vertical-align: bottom;">
            <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button"></div>
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
