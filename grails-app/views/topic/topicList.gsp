<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 17/6/15
  Time: 10:52 PM
--%>

<%@ page import="com.linksharing.Subscription" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic List</title>
    <meta name="layout" content="commonHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    %{--<script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}
    form label {display:inline-block ; width:100%;}
    #topic{margin:7% 2% 0% 2%; padding:0%;width:60%;height:auto;border:1px solid black;float: none;}
    .inner-container{margin:2%; padding:2%;text-align:left;border: 1px solid #000000; }
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .header-heading{font-size:32px;margin:0%;padding:0%;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:8%;}
    .right {
        float: right;
        clear: both;
    }

    img{
        margin-right: 1%;
        height:40px;
        width:40px;
    }
    ul{padding:0%;}
    ul li
    {
        margin-left: 0%;
        list-style-type: none;
        display: inline-block;
        padding-left: 15px;
    }
        .liMargin{
            margin-left: 10%;
        }

    </style>

</head>

<body>
    <div>
        <div id="topic">
            <div class="heading">Topic</div>
            <g:each in="${topicListsCreatedByUser}" var="topicLists">
            <div class="inner-container">
                <div>
                    %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                        <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
                    </g:if>--}%
                    <img src="${resource(dir: 'images',file: "/userImage/${topicLists.createdBy.username}")}" />
                </div>
                <div>
                    <ul>
                        <li><g:link controller="topic" action="showTopic" id="${topicLists.id}">${topicLists.name}</g:link> (${topicLists.visibility})</li>
                    </ul>
                    <ul>
                        <li>@ ${topicLists.createdBy.username}</li>
                    </ul>
                    <ul>
                        <li>Subscriptions</li>
                        <li>Topics</li>
                    </ul>
                    <ul>
                        <li>${topicLists.subscriptions.size()}</li>
                        <li class="liMargin">${user.topics.size()}</li>
                        <li class="right">
                            <a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                                <img src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            </g:each>
        </div>
    </div>
<g:render template="sendInvitationMail"></g:render>
</body>
</html>