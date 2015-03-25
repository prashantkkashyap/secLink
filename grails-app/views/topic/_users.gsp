<div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
<div>
    <ul>${totalSubscriptionUser.userName}</ul>
    <div>@${totalSubscriptionUser.firstName}</div>
    <ul>
        <li>Subscriptions</li>
        <li>Topics</li>
    </ul>
    <ul>
        <li>${totalSubscriptionUser.size()}</li>
        <li>${userTopic}</li>
    </ul>
</div>
