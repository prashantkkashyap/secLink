<g:each in="${userTopic}" var="userTopics">

<div class="inner-container" style="border:1px #000000 solid;">
    <div style="width: 40%;">
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%
        <img src="${resource(dir: 'images',file:"/userImage/${user.username}")}" />
    </div>
    <div id="subscriptionBorder" style="margin-top: 2%;">
        <div class="editTopicDiv" style="display: none;">
            <g:form class="form-group" controller="user" action="updateTopicName" id="${userTopics.id}">
                <g:textField style="background-color:yellowgreen;"  name="name" id="name" value="${userTopics.name}"></g:textField>
                <g:submitButton name="submitButton" value="Save"> </g:submitButton>
            </g:form>
        </div>
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
                    <sec:ifAllGranted roles="ROLE_ADMIN,ROLE_USER">
                        <g:form name='visibility' controller="topic"  id="${userTopics.id}" action="topicVisibility">
                            <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${userTopics.visibility}"/>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </sec:ifAllGranted>
                    %{--<g:if test="${userTopics.createdBy.id == user.id ||  user.admin == true}">
                        <g:form name='visibility' controller="topic"  id="${userTopics.id}" action="topicVisibility">
                            <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${userTopics.visibility}"/>
                            <noscript><input type="submit" value="submit"></noscript>
                        </g:form>
                    </g:if>--}%
                </div>
            </li>
        </li>
            <li><a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>
            </li>
            <li>
                <sec:ifAllGranted roles="ROLE_USER,ROLE_ADMIN">
                    <a data-toggle="modal" class="editDiv" href="">
                        <img src="${resource(dir:'images',file:'edit.png')}"/>
                    </a>
                </sec:ifAllGranted>
                %{--<g:if test="${userTopics.createdBy.id == user.id ||  user.admin == true}">
                    <a data-toggle="modal" class="editDiv" href="">
                        <img src="${resource(dir:'images',file:'edit.png')}"/>
                    </a>
                </g:if>--}%
            </li>
            <li>
            %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
            <sec:ifAllGranted roles="ROLE_USER,ROLE_ADMIN">
                <g:link controller="topic" action="topicDelete" id="${userTopics.id}">
                    <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                </g:link>
            </sec:ifAllGranted>
                %{--<g:if test="${userTopics.createdBy.id == user.id ||  user.admin == true}">
                    <g:link controller="topic" action="topicDelete" id="${userTopics.id}">
                        <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                    </g:link>
                </g:if>--}%
            </li>
        </ul>
    </div>
</div>
</g:each>