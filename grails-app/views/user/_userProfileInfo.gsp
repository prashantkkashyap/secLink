<div class="inner-container">
    <div>
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%
        <img src="${resource(dir: 'images',file:"/userImage/${user.userName}")}" />
    </div>
    <ul style="margin: 2%;">${user.firstName} ${user.lastName}</ul>
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
