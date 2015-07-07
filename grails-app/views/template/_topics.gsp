%{--${publicTopic.size()}--}%
<g:each in="${topicSearchList}" var="topicSearch">
<div class="inner-container">
    <div >
    <div>
        <ul>
            <li>
                <g:link controller="topic" action="showTopic" id="${topicSearch.id}">${topicSearch.name}</g:link>
            </li>
            <li>(${topicSearch.visibility})</li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul  >
            <li class="liStyle">${topicSearch.subscriptions.size()}</li>
            <li class="liStyle">${topicSearch.resources.size()}</li>
        </ul>
        <ul>
            <li>
                <div>
                    <g:form id="${topicSearch.subscriptions.id}" controller="subscriptions" action="seriousness">
                        <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${topicSearch.subscriptions.seriousness[0]}"></g:select>
                        <noscript><input type="submit" value="submit"></noscript>
                    </g:form>
                </div>
            </li>
            <li>
                <a data-toggle="modal" title="Send Invitation" class="sendInvitationDiv" href="javascript:">
                    <img src="${resource(dir: 'images', file:'mail.png')}" />
                </a>
            </li>
        </ul>
    </div>
</div>
<div  style="border-top: 1px solid #000000; padding-top: 3%;">
        <ul>
            <li><g:link controller="topic" action="showTopic" id="${topicSearch.id}">${topicSearch.name}</g:link></li>
            <li>
                <g:if test="${topicSearch.id != topicSearch.subscriptions.topicId[0]}" >
                    <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="subscribeTopic" id="${topicSearch.id}">Subscribe</g:link></li>
                </g:if>
                <g:elseif test="${topicSearch.id == topicSearch.subscriptions.topicId[0]}" >
                    <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="unSubscribeTopic" id="${topicSearch.id}">Unsubscribe</g:link></li>
                </g:elseif>
            </li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul>
            %{--<li><g:link>Subscribe</g:link></li>--}%
            <li class="liStyle">${topicSearch.subscriptions.size()}</li>
            <li class="liStyle">${topicSearch.resources.size()}</li>
        </ul>
</div>
</div>
</g:each>