<%@ taglib prefix="g" uri="http://grails.codehaus.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 17/2/15
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}
    #header{background-color:forestgreen; height:10%;width:auto;alignment:left;margin:0%;padding:2%;border:1px solid black;}
    .header-heading{font-size:32px;margin:0%;padding:0%;width: 20%;height: auto;}
    #search{margin: 0%;padding: 0%;width:auto;vertical-align: middle;float: none;clear: both;}
    form label {display:inline-block ; width:100%;}
    #Subscriptions{clear:both;margin:2% 0% 0% 2%; padding:0%;width:30%;height:auto;border:1px solid black;}
    #trending-topics{margin:2% 0% 0% 2%; padding:0%;width:30%;height:auto;border:1px solid black;}
    #inbox{clear:both;margin:2% 0% 0% 2%; padding:0%;width:60%;height:auto;border:1px solid black;}
    #create-topic{margin:2% 0% 0% 2%; padding:0%;width:60%;height:auto;border:1px solid black;}
    #top-posts{margin:2%; padding:0%;width:60%;border:1px solid black;}
    #invite{clear:both;margin:2%; padding:0%;width:30%;border:1px solid black;alignment:top;}
    #register{margin:2%; padding:0%;width:25%;border:1px solid black}
    .inner-container{margin:2%; padding:2%;text-align:left;}
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: forestgreen;width: auto;height:6%;}
    .right {
        float: right;
        clear: both;
        }
    .left {
        float: left;
        clear: both;
            }
    #subscriptionBorder{
        border-top: 1px solid black ;}
   /* div
    {
        border:1px solid black;
    }*/
    .userDiv{margin:2% 0% 0% 2%; padding:0%;width:30%;height:auto;border:1px solid black;}

    img{
        float:left;
        clear: both;
        margin-right: 1%;
        height:50px;
        width:50px;
    }
    ul li
    {
        list-style-type: none;
        display: inline-block;
    }
    </style>
    <script type="text/javascript">
  function sendInvitationPopup(){window.open("/dashboard/sendInvitationMail.gsp","","width=500,height=500"); }
    </script>
</head>
<body>
<div id="header"><div class="header-heading">Link Sharing</div> <div></div>
    <div class="right">
        <ul>
            <li><label for="search">Search &nbsp;&nbsp;</label>
                <input type="search" id="search"/></li>
            <li><img src="${resource(dir:'images',file:'mail.png')}"/></li>
            <li><img src="${resource(dir:'images',file:'link.png')}"/></li>
            <li><img src="${resource(dir:'images',file:'upload.png')}"/></li>
            <li><img src="${resource(dir:'images',file:'delete.png')}"/></li>
        </ul>
        <ul>
            <li></li>
        </ul>
    </div>
</div>
    <div class="userDiv">
        <g:render template="userInfo" model="${user},${userSubscription},${userTopic}"></g:render>
    </div>
   <div id="Subscriptions" class="left">
       %{--<g:render template="subscriptions" collection="${totalSubscriptionUser}" var="totalSubscription"></g:render>--}%
       <g:render template="subscriptions" model="${totalSubscriptionUser}"></g:render>
   </div>
<div id="inbox" class="right">
            <div class="heading">Inbox</div>
              <g:render template="inbox" model="${unreadResources}"></g:render>
            %{--<g:render template='recentShares' collection="${top2}" var="top"/>--}%
        </div>
    <div id="create-topic" class="right">
        <div class="heading">Create Topic</div>
        <div class="inner-container">
            <g:form action="loginHandler">
                <div class="line"><lable for="name">Name*:&nbsp;&nbsp;</lable><input type="name"  name="name"/></div>
                <div class="line"><lable for="visibility">Visibility*:&nbsp;&nbsp;</lable></div>
                <ul>
                    <li><select>
                        <option value="Public">Public</option>
                        <option value="Private">Private</option>
                    </select>
                    </li>
                </ul>
                <div><ul>
                    <li><lable for="save"></lable><input type="submit" value ='Save' /></li>
                    <li><lable for="cancel"></lable><input type="submit" value ='Cancel' /></li>
                </ul></div>
            </g:form>
        </div>
    </div>
     %{--<div id="trending-topics">
        <div class="heading">Trending Topics</div>
        <div>
            <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
            <div>
                <ul>Grails</ul>
                <ul>@uday</ul>
                <ul>
                    <li>Subscriptions</li>
                    <li>Post</li>
                </ul>
                <ul>
                    <li>50</li>
                    <li>30</li>
                </ul>
            </div>
        </div>
         <div><img src="${resource(dir:'images', file: 'businessman.jpg')}"/></div>
            <div>
                <ul>Grails</ul>
                <ul>@uday</ul>
                <ul>
                    <li>Subscriptions</li>
                    <li>Post</li>
                </ul>
                <ul>
                    <li>50</li>
                    <li>30</li>
                </ul>
                <ul>
                    <li><select>
                        <option value="Very Serious">Very Serious</option>
                        <option value="Serious" >Serious</option>
                        <option value="Casual" >Casual</option>
                    </select>
                    </li>
                    <li><select>
                        <option value="Public">Public</option>
                        <option value="Private">Private</option>
                    </select>
                    </li>
                    <li><img src="${resource(dir:'images',file:'mail.png')}"/></li>
                    <li><img src="${resource(dir:'images',file:'file_download.jpg')}"/></li>
                    <li><img src="${resource(dir:'images',file:'delete.png')}"/></li>
                </ul>
            </div>
         </div>--}%
</body>
</html>
