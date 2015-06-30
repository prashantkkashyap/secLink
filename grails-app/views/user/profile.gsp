<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 11/6/15
  Time: 5:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile</title>
    <meta name="layout" content="UserProfileHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    %{--<link rel="stylesheet" href="${resource(dir:'css',file: 'header.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'signin.css')}" >--}%
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
   %{-- <script rel="script"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>--}%

    <style type="text/css">
    body {font-family: Helvetica,Arial; font-size:12px;}

    form label {display:inline-block ; width:100%;}
    #editTopics{margin:2% 2% 0% 2%; padding:0%;width:40%;height:auto;border:1px solid black;float: none;}
    #changePassword{margin:2% 2% 2% 2%; padding:0%;width:50%;height:auto;border:1px solid black;
        float: right;clear:both;}
    #editProfile{margin:0% 2% 0% 2%; padding:0%;width:50%;height: auto; border:1px solid black;
        float: right;clear: both; }
    .userDiv{margin:7% 0% 0% 2%; padding:0%;width:40%;height:auto;border:1px solid black;}
    .inner-container{margin:2%; padding:2%;text-align:left;}
    input[type="email"],input[type="password"]{width:160px;}

    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:8%;}
    .headingContentDiv{
        width: 35%;margin:1.5% 3%;
    }
    .right {
        float: right;
            }


    img{
        margin-right: 1%;
        height:25px;
        width:25px;
    }
    ul li {
        list-style-type: none;
        display: inline-block;
    }

    ul{padding:0%;}
    ul li
    {
        margin: 0%;
        list-style-type: none;
        display: inline-block;
        padding-left: 15px;
    }
    .liStyle{
        margin-left: 8%;}
    .liStyle2{
        margin-left: 11%;
    }

    </style>
</head>
<body>
<div>
    <div id="editProfile" class="right">
        <div class="heading">
            <div class="headingContentDiv">Profile</div>
        </div>
        <g:render template='editProfile' ></g:render>
    </div>
</div>
<div>
    <div id="changePassword" >
        <div class="heading">
            <div class="headingContentDiv">Change Password</div>
        </div>
        <g:render template='changePassword' ></g:render>
    </div>
</div>
<div>
    <div class="userDiv">
        <g:render template='userProfileInfo' model="${user},${totalUserSubscriptions},${totalUserTopics}"></g:render>
    </div>
</div>
<div>
    <div id="editTopics" >
        <div class="heading">
            <div style=" margin-right:3.5%;">
                <g:form controller="search" action="topicSearch" class="navbar-form navbar-right">
                    <div class="form-group">
                        <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                        %{--<input type="hidden" name="topicId" value="${publicTopic.id}">--}%
                        <g:submitButton name="search"></g:submitButton>
                    </div>
                </g:form>
            </div>
            <div class="headingContentDiv">Topics</div>
        </div>
        <g:render template="editTopics" model="${user},${userTopic}" ></g:render>
    </div>
</div>
<g:render template="sendInvitationMail"></g:render>

</body>
</html>