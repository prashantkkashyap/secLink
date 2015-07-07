<g:each in="${trendingTopic}" var="trendingTopics">

<div class="inner-container" style="border: 1px solid #000000;">

    <div>
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%

        <img src="${resource(dir: 'images',file: "/userImage/${trendingTopics.user.userName}")}" />
    </div>
    <ul>
        <li>${trendingTopics.user.firstName} ${trendingTopics.user.lastName}</li>
        <li class="navbar-form navbar-right"><g:link controller="topic" action="showTopic" id="${trendingTopics.id}">${trendingTopics.resource.topic.name}</g:link></li>
        %{--<g:if test="${user.id != trendingTopics.resource.topic.subscriptions.id}" >
            <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="subscribeTopic" id="${trendingTopics.resource.topic.id}">Subscribe</g:link></li>
        </g:if>
        <g:elseif test="${user.id == trendingTopics.resource.topic.subscriptions.id}" >
            <li class="navbar-form navbar-right"> <g:link controller="subscriptions" action="unSubscribeTopic" id="${trendingTopics.resource.topic.id}">Unsubscribe</g:link></li>
        </g:elseif>--}%
    </ul>
    <ul>
        <li>@${trendingTopics.user.userName}</li>
    </ul>
    <ul>
        <li>Subscriptions</li>
        <li>Topics</li>
    </ul>
    <ul>
        <li class="liStyle">${trendingTopics.user.subscriptions.size()}</li>   %{-- user subscriptions size--}%
        <li class="liStyle">${trendingTopics.user.topics.size()}</li>         %{--  user topics size--}%
    </ul>

    <div  style="border-top: 1px solid #000000; padding-top: 2%;">

        <div><img src="${resource(dir: 'images' , file: 'businessman.jpg')}"/></div>
        <ul>
            <li>${trendingTopics.user.firstName} ${trendingTopics.user.lastName}</li>
            <li class="navbar-form navbar-right"><g:link controller="topic" action="showTopic" id="${trendingTopics.id}">${trendingTopics.resource.topic.name}</g:link></li>

        </ul>
        <ul>
            <li>@${trendingTopics.user.userName}</li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul>
            <li class="liStyle">${trendingTopics.user.subscriptions.size()}</li>   %{-- user subscriptions size--}%
            <li class="liStyle">${trendingTopics.user.topics.size()}</li>         %{--  user topics size--}%
        </ul>
        <ul>
             <li>
                 <div>
                     <g:form id="${trendingTopics.id}" controller="subscriptions" action="seriousness">
                         <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${trendingTopics.user.subscriptions.seriousness[0]}"></g:select>
                         <noscript><input type="submit" value="submit"></noscript>
                     </g:form>
                 </div>
             </li>
            <li>
                <div class="line">
                    <g:if test="${trendingTopics.user.id == user.id ||  user.admin == true}">
                        <g:form name='visibility' controller="topic"  id="${trendingTopics.id}" action="topicVisibility">
                            <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${trendingTopics.resource.topic.visibility}"/>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </g:if>
                </div>
            </li>
            <li class="navbar-form navbar-right" >
            %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
                <g:if test="${trendingTopics.user.id == user.id ||  user.admin== true}">
                    <g:link controller="topic" action="topicDelete" id="${userPost.id}">
                        <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                    </g:link>
                </g:if>
            %{-- </a>--}%
            </li>

            <li class="navbar-form navbar-right">
                <g:if test="${trendingTopics.user.id == user.id ||  user.admin == true}">
                    <a data-toggle="modal" href="javascript:void(0)" class="editTopic" >
                        <img src="${resource(dir:'images',file:'edit.png')}"/>
                    </a>
                </g:if>
            </li>

        </ul>
    </div>
</div>
</g:each>
