<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 16/6/15
  Time: 8:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="commonHeader"></g:layoutTitle></title>
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js',file: 'jquery.validate.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
    <script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <script>
        $(document).ready(function(){
            $("#form").validate();
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
            <g:link class="navbar-brand" controller="dashboard" action="dashboard">LinkSharing</g:link>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <ul class="navbar-form navbar-left">
                    <li>
                        <g:link controller="user" action="showUser">
                            <div>
                                %{--<g:if test="${totalSubscriptionUserTopic.createdBy ==null}">
                                    <img src="${resource(dir: 'images',file: 'businessman.jpg')}">
                                </g:if>--}%
                                <img src="${resource(dir: 'images',file: "/userImage/${user.userName}")}" />
                            </div>
                        </g:link>
                    </li>
                    <li><g:link controller="user" action="showUser"style="color:white;font-size: 15px;"><appTag:userFullName></appTag:userFullName></g:link></li>
                </ul>
                <div class="btn-group">
                    <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><g:link controller="user" action="profile">Profile</g:link></li>
                        <li><g:link controller="login" action="logout">Logout</g:link></li>
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
<g:applyLayout name="_shareDocument"></g:applyLayout>
<g:applyLayout name="_shareLink"></g:applyLayout>

</body>
</html>