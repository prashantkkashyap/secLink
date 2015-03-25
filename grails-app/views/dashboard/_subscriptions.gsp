
<div class="heading">Subscriptions<g:link  class="right" action="">View All</g:link></div>
<g:each in="${totalSubscriptionUser}" var="totalSubscription ">
<div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>

    <div id="subscriptionBorder">
          <ul>${totalSubscription.name}</ul>
        <ul>${totalSubscription.createdBy.firstName}</ul>
        <ul>
            <li>Subscriptions</li>
            <li>Post</li>
        </ul>
        <ul>
            <li>${totalSubscriptionUser.size()}</li>
            <li>${totalSubscription.resources.size()}</li>
        </ul>
        <ul>
            <li><div><select>
                <option value="Very Serious">Very Serious</option>
                <option value="Serious" >Serious</option>
                <option value="Casual" >Casual</option>
            </select></div>
            </li>
            <li><div class="line"><lable for="visibility"></lable> ${totalSubscription.visibility}</div>
            </li>
            <li><a href="javascript:void(0)" onclick="sendInvitationPopup()" ><img src="${resource(dir:'images',file:'mail.png')}"/></a></li>
            <li><img src="${resource(dir:'images',file:'file_download.jpg')}"/></li>
            <li><img src="${resource(dir:'images',file:'delete.png')}"/></li>

        </ul>
   </div>
</g:each>
