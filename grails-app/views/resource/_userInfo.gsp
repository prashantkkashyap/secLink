<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource" %>
<div class="inner-container">
    <div>
        %{--<g:if test="${user.photo ==null}">
            <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
        </g:if>--}%

        <img src="${resource(dir: 'images',file: "/userImage/${userPost.createdBy.username}")}" />
    </div>
    <ul>
        <li>${userPost.createdBy.firstName}</li>
        <li><g:link controller="topic" action="showTopic" id="${userPost.id}">${userPost.topic.name}</g:link></li>
    </ul>
    <ul>
        <li>@${userPost.createdBy.username}</li>
        <li>${userPost.dateCreated}</li>
       <div class="navbar-form navbar-right" style="margin-top: 5%;">
           <div>
              %{-- <span class="starRating">
                   <input id="rating5" type="radio" name="rating" value="5">
                   <label for="rating5">5</label>
                   <input id="rating4" type="radio" name="rating" value="4">
                   <label for="rating4">4</label>
                   <input id="rating3" type="radio" name="rating" value="3">
                   <label for="rating3">3</label>
                   <input id="rating2" type="radio" name="rating" value="2">
                   <label for="rating2">2</label>
                   <input id="rating1" type="radio" name="rating" value="1">
                   <label for="rating1">1</label>
               </span>--}%
           </div>
        <div class="btn-group">
            <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Rating <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li>
                    <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:1]">1</g:link>
                </li>
                <li>
                    <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:2]">2</g:link>
                </li>
                <li>
                    <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:3]">3</g:link>
                </li>
                <li>
                    <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:4]">4</g:link>
                </li>
                <li>
                    <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:5]">5</g:link>
                </li>
            </ul>
        </div>
       </div>
    </ul>
    <div><p>${userPost.description}</p></div>
       <ul>
           <li>
               <a id="shareFB" href="https://www.facebook.com/sharer/sharer.php?u=URLENCODED_URL&t=TITLE"
                  onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
                  target="_blank" title="Share on Facebook">
                   <span ><img style="width: auto;" src="${resource(dir: 'images',file:'facebook.png')}"></span></a>
               <script type="text/javascript">document.getElementById("shareFB").setAttribute("href", "https://www.facebook.com/sharer/sharer.php?u=" + document.URL);</script>
           </li>
           <li>
               <div class="btn-o" data-scribe="component:button" style="width: 55px ;">
                   <a target="_blank" href="https://twitter.com/intent/tweet?original_referer= "class=btn">
                       <i></i>
                       <span ><img style=";" src="${resource(dir: 'images',file:'twitter.jpg')}"></span>
                   </a>
               </div>
           </li>
           <li>
               <a href="https://plus.google.com/share?url=URLENCODED_URL"
                  onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=480');return false;"
                  target="_blank" title="Share on Google+">
                   <span ><img style="width: auto;" src="${resource(dir: 'images',file:'gplus.png')}"></span>
               </a>
           </li>

           <g:if test="${session['user']}">
           <li class="navbar-form navbar-right">
           %{-- <a data-toggle="modal" href="javascript:void(0)">--}%
               <sec:ifAllGranted roles="ROLE_USER,ROLE_ADMIN">
                   <g:link controller="topic" action="topicDelete" id="${userPost.id}">
                       <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                   </g:link>
               </sec:ifAllGranted>
              %{-- <g:if test="${userPost.createdBy.id == user.id ||  user.admin == true}">
                   <g:link controller="topic" action="topicDelete" id="${userPost.id}">
                       <img src="${resource(dir:'images',file:'delete.jpg')}"/>
                   </g:link>
               </g:if>--}%
           %{-- </a>--}%
           </li>

           <li class="navbar-form navbar-right">
               <sec:ifAllGranted roles="ROLE_USER,ROLE_ADMIN">
                   <a data-toggle="modal" href="javascript:void(0)" class="editTopic" >
                       <img src="${resource(dir:'images',file:'edit.png')}"/>
                   </a>
               </sec:ifAllGranted>
               %{--<g:if test="${userPost.createdBy.id == user.id ||  user.admin == true}">
                   <a data-toggle="modal" href="javascript:void(0)" class="editTopic" >
                       <img src="${resource(dir:'images',file:'edit.png')}"/>
                   </a>
               </g:if>--}%
           </li>
           </g:if>
           %{--<g:if test="${userPost.instanceOf(LinkResource)}">
               <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
           </g:if> <g:elseif test="${userPost.instanceOf(DocumentResource)}">
                <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
            </g:elseif>--}%
       </ul>
</div>
