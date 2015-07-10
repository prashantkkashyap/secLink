<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="header">

    <title>Dashboard</title>
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'signin.css')}" >
    <link type="text/css" rel="stylesheet" href="${resource(dir:'css',file: 'header.css')}">
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel="script"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>

    <style type="text/css">
    body {font-family: Helvetica,Arial; font-size:12px;}

    form label {display:inline-block ; width:100%;}
    #subscriptions{margin:2% 0% 0% 2%; padding:0%;width:35%;height:auto;border:1px solid black;}
    #inbox{margin:4% 2% 0% 2%; padding:0%;width:58%;height:auto;border:1px solid black;
        float: right;clear:both;}
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
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:6%;}
    .right {
        float: right;
        }

    .userDiv{margin:4% 0% 0% 2%; padding:0%;width:35%;height:auto;border:1px solid black;}

    img{
        margin-right: 1%;
        height:40px;
        width:40px;
    }
    ul li {
        list-style-type: none;
        display: inline-block;
    }
    .liStyle{
        margin-left: 6%;}
    .liStyle2{
        margin-left: 15%;
    }

    .modal-header, h4, .close {
        background-color: #5cb85c;
        color:white !important;
        text-align: center;
        font-size: 30px;
    }
    .modal-footer {
        background-color: #f9f9f9;
    }
        </style>
       %{-- <script type="text/javascript">
  function sendInvitationPopup(){window.open("/dashboard/sendInvitationPopup","_blank","width=600,height=600"); }
    </script>--}%
</head>
<body>

%{--start facebook share--}%

<div id="fb-root"></div>
<script> $(document).read(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>

%{--end facebook share--}%

<div id="inbox" class="right">
    <div class="heading">Inbox</div>
    <g:render template="inbox" model="${unreadResources}"></g:render>
    %{--<g:render template='recentShares' collection="${top2}" var="top"/>--}%
</div>
<div class="userDiv">
        <g:render template="userInfo" model="${user},${userSubscription},${userTopic}"></g:render>
</div>


<div id="subscriptions">
    <div class="heading">Subscriptions<g:link target="_blank" class="navbar-form navbar-right" controller="subscriptions" action="subscribedTopics">View All</g:link></div>
       %{--<g:render template="subscriptions" collection="${totalSubscriptionUser}" var="totalSubscription"></g:render>--}%
       <g:render template="subscriptions" model="${subscriptionUserTopicList} ${user}${topicCreatedByUser}"></g:render>
</div>

</body>
</html>
