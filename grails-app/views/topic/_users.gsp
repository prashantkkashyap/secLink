<g:each in="${subscribedUsers}" var="user" >
<div class="inner-container"  style="border: 1px solid #000000;">
    <div>
        <img src="${resource(dir:'images', file: "/userImage/${user.username}")}"/>
    </div>
    <ul>
        <li>${user.firstName} ${user.lastName}</li>
    </ul>
    <ul>
        <li>@ ${user.username}</li>
    </ul>
    <ul>
        <li>Subscriptions</li>
        <li>Topics</li>
    </ul>
    <ul>
        <li class="liStyle">${totalSubscribeUserTopic}</li>
        <li class="liStyle">${totalUserTopic}</li>
    </ul>

</div>
</g:each>
