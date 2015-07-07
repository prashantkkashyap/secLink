<%@ page import="com.linksharing.User; com.linksharing.Topic" %>
<g:each in="${subscriptionUserTopicList}" var="totalSubscriptionUserTopic">
    <div class="inner-container" style="border:1px #000000 solid;">
        <div>
            %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
            </g:if>--}%
            <img src="${resource(dir: 'images',file: "/userImage/${totalSubscriptionUserTopic.createdBy.userName}")}" />
        </div>
            <div id="subscriptionBorder" >
                <ul>
                    <li>
                        <g:link controller="topic" action="showTopic"  id="${totalSubscriptionUserTopic.id}"> ${totalSubscriptionUserTopic.name}</g:link>
                    </li>
                    <li class="liStyle">${totalSubscriptionUserTopic.createdBy.firstName}</li>
                </ul>
                <ul>
                    <li class="liStyle">Subscriptions</li>
                    <li class="liStyle">Post</li>
                </ul>
                <ul>
                    <li class="liStyle2">${subscriptionUserTopicList.size()}</li>
                    <li class="liStyle2">${totalSubscriptionUserTopic.resources.size()}</li>
                </ul>
                <ul>
                    <li>
                        <div>
                            <g:form id="${totalSubscriptionUserTopic.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${totalSubscriptionUserTopic.subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                    <li>
                        <div class="line">
                            <g:if test="${totalSubscriptionUserTopic.createdBy.id == user.id ||  user.admin == true}">
                                <g:form name='visibility' controller="topic"  id="${totalSubscriptionUserTopic.id}" action="topicVisibility">
                                    <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${totalSubscriptionUserTopic.visibility}"/>
                                    <noscript><input type="submit" value="submit"></noscript>
                                </g:form>
                            </g:if>
                        </div>
                    </li>
                    <li><a data-toggle="modal" titele="Send Invitations" class="sendInvitationMail" href="javascript:void(0)">
                        <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>
                    </li>
                    <li>
                    <g:if test="${totalSubscriptionUserTopic.createdBy.id == user.id ||  user.admin == true}">
                        <a data-toggle="modal" class="editDiv" href="javascript:">
                            <img src="${resource(dir:'images',file:'edit.png')}"/>
                        </a>
                    </g:if>
                    </li>
                    <li>
                       %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
                        <g:if test="${totalSubscriptionUserTopic.createdBy.id == user.id ||  user.admin == true}">
                            <g:link controller="topic" action="topicDelete" id="${totalSubscriptionUserTopic.id}">
                              <span> <img src="${resource(dir:'images',file:'delete.jpg')}"/></span>
                            </g:link>
                        </g:if>
                       %{-- </a>--}%
                    </li>
                </ul>
            </div>
        <div class="editTopicDiv" style="border-top: solid #000000 1px;display: none;">
            <div style="margin: 4%;">

                %{--<appTag:visibilityTag topic="${totalSubscriptionUserTopic}"></appTag:visibilityTag>--}%
                <g:form class="form-group" controller="topic" action="updateTopicName" id="${totalSubscriptionUserTopic.id}">
                    <g:textField name="name" value="${totalSubscriptionUserTopic.name}" style="background-color: greenyellow;" >${totalSubscriptionUserTopic.name}</g:textField>
                    <g:submitButton name="save" value="Save"> </g:submitButton>
                </g:form>
                    <ul>
                    <li class="liStyle">Subscriptions</li>
                    <li class="liStyle">Post</li>
                </ul>
                <ul>
                    <li class="liStyle2">${subscriptionUserTopicList.size()}</li>
                    <li class="liStyle2">${totalSubscriptionUserTopic.resources.size()}</li>
                </ul>
                <ul>
                    <li>
                        <div>
                            <g:form id="${totalSubscriptionUserTopic.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${totalSubscriptionUserTopic.subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</g:each>

