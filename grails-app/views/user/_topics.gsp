${publicTopic.size()}
<g:each in="${publicTopic}" var="publicTopics">
<div class="inner-container">
    <div >
    <div>
        <ul>
            <li>
                <g:link controller="topic" action="showTopic" id="${publicTopics.id}">${publicTopics.name}</g:link>
            </li>
            <li>(${publicTopics.visibility})</li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul  >
            <li class="liStyle">${publicTopics.subscriptions.size()}</li>
            <li class="liStyle">${publicTopics.resources.size()}</li>
        </ul>
        <ul>
            <li>
                <div>
                    <g:form id="${publicTopics.subscriptions.id}" controller="subscriptions" action="seriousness">
                        <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${publicTopics.subscriptions.seriousness[0]}"></g:select>
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
            <li><g:link controller="topic" action="showTopic" id="${publicTopics.id}">${publicTopics.name}</g:link></li>
            <li>
                <g:if test="${publicTopics.id != publicTopics.subscriptions.topicId[0]}" >
                    <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="subscribeTopic" id="${publicTopics.id}">Subscribe</g:link></li>
                </g:if>
                <g:elseif test="${publicTopics.id == publicTopics.subscriptions.topicId[0]}" >
                    <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="unSubscribeTopic" id="${publicTopics.id}">Unsubscribe</g:link></li>
                </g:elseif>
            </li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul>
            %{--<li><g:link>Subscribe</g:link></li>--}%
            <li class="liStyle">${publicTopics.subscriptions.size()}</li>
            <li class="liStyle">${publicTopics.resources.size()}</li>
        </ul>
</div>
</div>
</g:each>