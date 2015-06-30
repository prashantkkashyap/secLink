<div class="inner-container">
    <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
    <ul>
        <li> ${user.userName}</li>
    </ul>
    <ul>
        <li>@${user.firstName}</li>
    </ul>
    <ul>
         <li class="liStyle"><g:link controller="subscriptions" action="subscribedTopics">Subscriptions</g:link></li>
        <li class="liStyle"><g:link controller="topic" action="topicList">Topics</g:link></li>
        </ul>
         <ul>
        <li class="liStyle2">${userSubscription}</li>
        <li class="liStyle2">${userTopic}</li>
        </ul>
</div>
