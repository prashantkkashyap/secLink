<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 12/6/15
  Time: 2:08 PM
--%>

<%@ page import="com.linksharing.DocumentResource; com.linksharing.LinkResource; com.linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post</title>
    <meta name="layout" content="commonHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'rating.css')}">
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel="script" src="${resource(dir: 'js', file: 'linksharing.js')}"></script>

    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}
    form label {display:inline-block ; width:100%;}
    #users{margin:8% 2% 0% 2%; padding:0%;width:50%;border:1px solid black;}
    #trendingTopics{margin:0% 2% 0% 2%; padding:0%;width:45%;float: right;clear: both; border:1px solid black;}
    #loginDiv{margin-right:2%; padding:0%;width:30%;border:1px solid black;alignment:top;
        float: right;clear: both;}
    #register{margin:2%; padding:0%;width:30%;border:1px solid black; float : right;
        clear: both;}
    .inner-container{margin:2%; padding:2%;text-align:left;}
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .header-heading{font-size:32px;margin:0%;padding:0%;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:6%;}
    .right {
        float: right;
        clear: both;
    }

    img{
        margin: 0%;
        height:25px;
        width:25px;
    }
    ul{padding:0%;}

    ul li
    {
        margin-right:0%;
        list-style-type: none;
        display: inline-block;
        padding-left: 15px;
    }
    .liStyle{
        margin-left: 7%;}
    .liStyle2{
        margin-left: 11%;
    }
    </style>
</head>
<body>
%{--<g:if test="${!session['user']}">
<div id="loginDiv" class="right">
    <div class="heading">Login</div>
    <g:render template='/template/login'></g:render>
</div>
<div id="register" class="right">
    <div class="heading">Register</div>
    <g:render template='/template/register'></g:render>
</div>
</g:if>--}%
<div>
    <div id="trendingTopics">
        <div class="heading">Trending Topics</div>
        <g:render template='trendingTopics' model="${trendingTopic}"></g:render>
    </div>
</div>
<div>
    <div id="users">
        <g:render template="userInfo" model="${user}, ${userPost}"></g:render>
        %{--<div class="inner-container">
            <div><img src="${resource(dir: 'images' , file: 'businessman.jpg')}"/></div>
            <ul>
                <li>${userPost.createdBy.firstName}</li>
                <li>${userPost.topic.name}</li>
            </ul>
            <ul>
                <li>@${userPost.createdBy.userName}</li>
                <li>${userPost.dateCreated}</li>
                <div class="navbar-form navbar-right" style="margin-top: 5%;">
                    <div class="btn-group">
                        <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Rating <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="resourceRatings" action="resourceRatings" id="${userPost.id}" params="[rating:1]">1</g:link>
                            </li>                <li>
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
                <li><img src="${resource(dir: 'images',file:'facebook.jpg')}"></li>
                <li><img src="${resource(dir:'images', file:'twitter.jpg')}"></li>
                <li><img src="${resource(dir:'images', file:'gplus.png')}"></li>

                <g:if test="${userPost.instanceOf(com.linksharing.LinkResource)}">
                    <li class="navbar-form navbar-right"><g:link>View full site</g:link></li>
                </g:if> <g:elseif test="${userPost.instanceOf(com.linksharing.DocumentResource)}">
                <li class="navbar-form navbar-right"><g:link>Download</g:link></li>
            </g:elseif>
            </ul>
        </div>--}%
    </div>
</div>
</body>
</html>