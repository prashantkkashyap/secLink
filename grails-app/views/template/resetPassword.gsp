<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 11/6/15
  Time: 5:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Reset Password</title>
    %{--<meta name="layout" content="UserProfileHeader">--}%
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    %{--<link rel="stylesheet" href="${resource(dir:'css',file: 'header.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'signin.css')}" >--}%
    %{--<script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    %{-- <script rel="script"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>--}%
    <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'jquery.validate.js')}"></script>

    <style type="text/css">
    body {font-family: Helvetica,Arial; font-size:12px;}

    form label {display:inline-block ; width:100%;}
    #changePassword{margin:7% 2% 2% 2%; padding:0%;width:50%;height:auto;border:1px solid black;
        }
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
        height:40px;
        width:40px;
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
    <script>
        $(document).ready(function(){
            $(".passValidate").validate();
        });

    </script>
</head>
<body>
<nav class="nav navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">LinkSharing</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                %{--<div class="form-group">
                    <input class="form-control"  type="search" id="search" placeholder="Search"  />
           </div>--}%
            </form>
        </div>
    </div>
</nav>
<div>
    <div id="changePassword" >
        <div class="heading">
            <div class="headingContentDiv">Reset Password</div>
        </div>
        <div class="inner-container">
        %{--<g:hasErrors bean="${user}">
            <div>
                <g:renderErrors bean="${user}" as="list"/>
            </div>
        </g:hasErrors>--}%
            <g:form class="passValidate" controller="myLogin" action="resetPassword" id="${params.id}">
                <fieldset>
                    <div class="line">
                        <label for="password">Password*: </label>
                        <g:passwordField name="password" id="password" required="required"  novalidate="novalidate"/>

                    </div>
                    <div class="line">
                        <label for="confirm">Confirm Password*: </label>
                        <g:passwordField name="confirm" id="confirm" required="required"  novalidate="novalidate"/>

                    </div>
                    <div class="line">
                        <g:submitButton name="submitButton" value="Update" />
                    </div>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>