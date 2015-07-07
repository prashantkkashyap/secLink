<div class="inner-container" style="border:1px #000000 solid;">
    <div>
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%

        <img src="${resource(dir: 'images',file:'businessman.jpg')}" />
    </div>
    <div>
        <ul>
            <li>TopicName (Visibility)</li>
            <li>
                %{--<g:if test="${user.id != trendingTopics.user.id}" >
                    <li class="navbar-form navbar-right"> <g:link>Subscribe</g:link></li>
                </g:if>
                <g:elseif test="${user.id == trendingTopics.user.id}" >
                    <li class="navbar-form navbar-right"> <g:link>Unsubscribe</g:link></li>
                </g:elseif>--}%
            </li>
        </ul>
        <div>@ Name</div>
        <ul>
            <li>Subscriptions</li>
            <li>Topics</li>
        </ul>
        <ul>
            <li>50</li>
            <li>30</li>
        </ul>
        <ul>
            <li>
                <select class="right">
                    <option value="${com.Seriousness.SERIOUS}">Serious</option>
                    <option value="${com.Seriousness.VERY_SERIOUS}" >Very Serious</option>
                    <option value="${com.Seriousness.CASUAL}" >Casual</option>
                </select>
            </li>
            <li><a data-toggle="modal" title="Send Invitation" class="sendInvitationDiv" href="javascript:"><img src="${resource(dir: 'images', file:'mail.png')}" /></a></li>
        </ul>
    </div>
    <div style="border-top:1px #000000 solid; ">
        <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
    </div>
    <div id="subscriptionBorder">
        <form class="form-group">
            <g:textField name="updateTopic"></g:textField>
            <g:submitButton name="saveTopic" value="Save"> </g:submitButton>
        </form>
        <ul>@ firstName</ul>
        <ul>
            <li>Subscriptions</li>
            <li>Post</li>
        </ul>
        <ul>
            <li>50</li>
            <li>30</li>
        </ul>
        <ul>
            <li>
                <div>
                    <select>
                        <option value="${com.Seriousness.VERY_SERIOUS}">Very Serious</option>
                        <option value="${com.Seriousness.SERIOUS}" >Serious</option>
                        <option value="${com.Seriousness.CASUAL}" >Casual</option>
                    </select>
                </div>
            </li>
            <li>
                <div class="line">
                    <select>
                        <option value="${com.Visibility.PUBLIC}">Public</option>
                        <option value="${com.Visibility.PRIVATE}">Private</option>
                    </select>
                    <lable for="visibility"></lable>
                </div>
            </li>
        </li>
            <li><a data-toggle="modal" class="subscribeSendInvitationsModalDiv" href="javascript:void (0)">
                <img  src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/></a>
            </li>
            <li>
                <a data-toggle="modal"  href="javascript:void(0)">
                    <img src="${resource(dir:'images',file:'edit.png')}"/>
                </a>
            </li>
            <li>
                <a data-toggle="modal" href="javascript:void(0)">
                    <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                </a>
            </li>
        </ul>
    </div>
</div>