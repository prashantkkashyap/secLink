<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 16/6/15
  Time: 8:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title><g:layoutTitle default="header"></g:layoutTitle></title>
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
    <script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js',file: 'jquery.validate.js')}"></script>
    <script>
        $(document).ready(function(){
            $("#form").validate();
        });
        $(".secSwitchUserModalDiv").click(function(){
            console.log ("Hello")
            $("#secSwitchUserModal").modal();
        });
    </script>

<style type="text/css">

ul li {
    list-style-type: none;
    display: inline-block;
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
    <g:layoutHead/>
</head>
<body>

<nav class="nav navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <g:link class="navbar-brand" controller="dashboard" title="Linksharing-Dashboard" action="dashboard">LinkSharing</g:link>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <ul class="navbar-form navbar-left">
                      <li>
                        <g:link controller="user" action="showUser">
                                    %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                                    <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
                                </g:if>--}%
                                <img src="${resource(dir: 'images',file: "/userImage/${user.username}")}" />
                        </g:link>
                    </li>
                    <li><g:link controller="user" action="showUser" style="color:white;font-size: 15px;"><appTag:userFullName></appTag:userFullName></g:link></li>
                </ul>
                <div class="btn-group">
                    <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><g:link controller="user" action="profile">Profile</g:link></li>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li><g:link controller="user" action="list">Users</g:link></li>
                        </sec:ifAllGranted>
                        %{--<g:if test="${user.admin==true}">
                        <li><g:link controller="user" action="list">Users</g:link></li>
                        </g:if>--}%
                        <li><g:link controller="topic" action="topicList">Topics</g:link></li>
                        <li><g:link controller="resource" action="viewPost">Posts</g:link></li>
                       %{-- <li><a data-toggle="modal" title="Switch User" class="secSwitchUserModalDiv" href="javascript:">Switch User</a></li>--}%

                        <li><g:link controller="dashboard" action="secSwitchUser">Switch User</g:link></li>

                        <li><g:link controller="myLogout">Logout</g:link></li>
                    </ul>
                </div>
            </div>

            <div class="navbar-form navbar-right">
                <g:form controller="search" action="search" >
                    <input class="form-control" type="search" id="search" name="query" value="${params.query}" placeholder="Search"  />
                    <g:submitButton name="search"></g:submitButton>
                </g:form>
            </div>
            <div class="navbar-form navbar-right">
                <ul>
                    <li>
                        <a data-toggle="modal" title="Create Topic" class="createTopicModalDiv" href="javascript:void(0)">
                            <img src="${resource(dir:'images',file:'topic.png')}"/>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="modal" title="Send Invitation" class="sendInvitationMail" href="javascript:">
                            <img src="${resource(dir:'images',file:'email-letter-icon.jpg')}"/>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="modal" title="Share Link" class="shareLinkModalDiv" href="javascript:">
                            <img src="${resource(dir:'images',file:'link.png')}"/>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="modal" title="Share Document" class="shareDocumentModalDiv" href="javascript:">
                            <img src="${resource(dir:'images',file:'upload1.jpg')}"/>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<g:layoutBody/>
<g:applyLayout name="_createTopic"></g:applyLayout>
<g:applyLayout name="_sendInvitationMail"></g:applyLayout>
<g:applyLayout name="_shareDocument"></g:applyLayout>
<g:applyLayout name="_shareLink"></g:applyLayout>
<g:applyLayout name="_secSwitchUser"></g:applyLayout>

</body>
</html>