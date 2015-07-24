<%@ page import="com.linksharing.Subscription; com.linksharing.Topic" %>

<div class="inner-container">
    <div>
        <img src="${resource(dir:'images', file: "/userImage/${topic.createdBy.username}")}"/>
    </div>
    <div>
        <ul>
            <li>${topic.name} (${topic.visibility})</li>
        </ul>
        <ul>
            <li>@ ${topic.createdBy.username}</li>
            <li>
            <g:if test="${topic.id != topic.subscriptions.topicId[0]}" >
                <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="subscribeTopic" id="${topic.id}">Subscribe</g:link></li>
            </g:if>
            <g:elseif test="${topic.id == topic.subscriptions.topicId[0]}" >
                <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="unSubscribeTopic" id="${topic.id}">Unsubscribe</g:link></li>
            </g:elseif>
            </li>
            <li>
                <a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                    <img src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/>
                </a>
            </li>
        </ul>
            <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul>
            <li class="liStyle">${totalSubscribeTopic}</li>
            <li class="liStyle">${totalTopic}</li>
        </ul>
        <ul>
            <g:each in="${subscribedTopic}" var="subscribed">
            <g:if test="${subscribed.instanceOf(com.linksharing.Subscription)}">
                <li></li>
            </g:if>
            <g:else>
                  <li> <g:link controller="subscriptions" action="subscriptionTopics" id="${topic.id}">Subscribe</g:link></li>
                <li>
                    <div>
                        <g:form id="${topic.id}" controller="subscriptions" action="seriousness">
                            <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${topic.subscriptions.seriousness[0]}"></g:select>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </div>
                </li>
            </g:else></g:each>
        </ul>
    </div>
</div>