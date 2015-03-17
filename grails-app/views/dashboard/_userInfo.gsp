<div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
<div>
<ul>${user.userName}</ul>
  <div>@${user.firstName}</div>
    <ul>
        <li>Subscriptions</li>
        <li>Topics</li>
    </ul>
    <ul>
        <li>${userSubscription}</li>
        <li>${userTopic}</li>
    </ul>
</div>
