<div class="heading">Subscriptions<g:link  class="right" action="">View All</g:link></div>
    <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
<g:each in="${totalSubscriptionUser}" var="totalSubscription ">
    <div id="subscriptionBorder">
          <ul>${totalSubscription.name}</ul>
        <ul>${totalSubscription.createdBy.firstName}</ul>
        <ul>
            <li>Subscriptions</li>
            <li>Post</li>
        </ul>
        <ul>
            <li>${totalSubscriptionUser.size()}</li>
            <li>30</li>
        </ul>
        <ul>
            <li><div><select>
                <option value="Very Serious">Very Serious</option>
                <option value="Serious" >Serious</option>
                <option value="Casual" >Casual</option>
            </select></div>
            </li>
            <li><select>
                <option value="Public">Public</option>
                <option value="Private">Private</option>
            </select>
            </li>
            <li><a href="javascript:sendInvitationPopup"><img src="${resource(dir:'images',file:'mail.png')}"/></a></li>
            <li><img src="${resource(dir:'images',file:'file_download.jpg')}"/></li>
            <li><img src="${resource(dir:'images',file:'delete.png')}"/></li>

        </ul>
   </div>
</g:each>
