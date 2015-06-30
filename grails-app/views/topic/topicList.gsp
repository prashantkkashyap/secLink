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
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:6%;}
    .right {
        float: right;
        clear: both;
    }

    img{
        margin-right: 1%;
        height:25px;
        width:25px;
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
                    <img src="${resource(dir:'images', file: 'businessman.jpg')}"/>
                </div>
                <div>
                    <ul>
                        <li><g:link controller="topic" action="showTopic" id="${topicLists.id}">${topicLists.name}</g:link> (${topicLists.visibility})</li>
                    </ul>
                    <ul>
                        <li>@ ${topicLists.createdBy.userName}</li>
                        <li>Subscriptions</li>
                        <li>Topics</li>
                    </ul>
                    <ul>
                        <li class="liMargin">${topicLists.subscriptions.size()}</li>
                        <li class="liMargin">${user.topics.size()}</li>
                    </ul>
                    <li><a data-toggle="modal" title="Send Invitation" class="sendInvitationDiv" href="javascript:"><img src="${resource(dir: 'images', file:'mail.png')}" /></a></li>
                    </ul>
                </div>
            </div>
            </g:each>
        </div>
    </div>
</body>
</html>