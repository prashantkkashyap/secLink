<div class="inner-container">
    <div>
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%

            <img src="${resource(dir: 'images',file: "/userImage/${user.username}")}" />
    </div>

    <ul>
        <li> ${user.username}</li>
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
