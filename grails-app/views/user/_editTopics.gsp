<g:each in="${userTopic}" var="userTopics">

<div class="inner-container" style="border:1px #000000 solid;">
    <div>
        <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
    </div>
    <div id="subscriptionBorder">
        <g:form class="form-group" controller="user" action="updateTopicName" id="${userTopics.id}">
            <g:textField style="background-color:yellowgreen;"  name="name" id="name" value="${userTopics.name}"></g:textField>
            <g:submitButton name="submitButton" value="Save"> </g:submitButton>
        </g:form>
        <ul>
            <li>@ ${user.firstName}</li>
            <li> <g:link controller="topic" action="showTopic" id="${userTopics.id}">${userTopics.name}</g:link></li>
        </ul>
        <ul>
            <li>Subscriptions</li>
            <li>Post</li>
        </ul>
        <ul>
            <li class="liStyle">${userTopics.subscriptions.size()}</li>
            <li class="liStyle">${userTopics.resources.size()}</li>
        </ul>
        <ul>
            <li>
                <div>
                    <g:form id="${userTopics.id}" controller="subscriptions" action="seriousness">
                        <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${userTopics.subscriptions.seriousness[0]}"></g:select>
                        <noscript><input type="submit" value="submit"></noscript>
                    </g:form>
                </div>
            </li>
            <li>
                <div class="line">
                    <g:if test="${userTopics.createdBy.id == user.id ||  user.isAdmin() == true}">
                        <g:form name='visibility' controller="topic"  id="${userTopics.id}" action="topicVisibility">
                            <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${userTopics.visibility}"/>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </g:if>
                </div>
            </li>
        </li>
            <li><a data-toggle="modal" class="sendInvitationsModalDiv" href="javascript:">
                <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>
            </li>
            <li>
                <g:if test="${userTopics.createdBy.id == user.id ||  user.isAdmin() == true}">
                    <a data-toggle="modal" href="javascript:void(0)" class="editTopic" >
                        <img src="${resource(dir:'images',file:'edit.png')}"/>
                    </a>
                </g:if>
            </li>
            <li>
            %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
                <g:if test="${userTopics.createdBy.id == user.id ||  user.isAdmin() == true}">
                    <g:link controller="topic" action="topicDelete" id="${userTopics.id}">
                        <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                    </g:link>
                </g:if>
            </li>
        </ul>
    </div>
</div>
</g:each>