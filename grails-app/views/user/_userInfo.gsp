<div class="inner-container">
    <div><img src="${resource(dir: 'images' , file: 'businessman.jpg')}"/></div>
    <ul>${user.firstName} ${user.lastName}</ul>
        <div>@ ${user.userName}</div>
        <ul>
         <li>Subscriptions</li>
         <li>Topics</li>
        </ul>
         <ul>
        <li class="liStyle">${user.subscriptions.size()}</li>
        <li class="liStyle">${user.topics.size()}</li>
        </ul>
</div>
