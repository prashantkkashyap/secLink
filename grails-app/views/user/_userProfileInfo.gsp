<div class="inner-container">
    <div><img src="${resource(dir: 'images' , file: 'businessman.jpg')}"/></div>
    <ul>${user.firstName} ${user.lastName}</ul>
    <div>@ ${user.userName}</div>
    <ul>
        <li>Subscriptions</li>
        <li>Topics</li>
    </ul>
    <ul>
        <li class="liStyle">${totalUserSubscriptions}</li>
        <li class="liStyle">${totalUserTopics}</li>
    </ul>
</div>
