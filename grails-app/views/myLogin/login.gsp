%{--<%@ taglib prefix="g" uri="http://grails.codehaus.org/tags" %>--}%
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login</title>
    <link rel="stylesheet" href=${resource(dir: 'css', file: 'signin.css')}>
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script type="text/javascript"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
    <script  type="text/javascript" rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <script  type="text/javascript" rel="script" src="${resource(dir: 'js',file: 'jquery.validate.js')}"></script>
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
    <script>
        $(document).ready(function(){
            $(".emailValidate").validate();
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
%{--<div class="container">
    <div class="panel-group">
        <div class="panel panel-primary">
            <div class="panel-heading">LinkSharing</div>
        </div>
     </div>
</div>--}%
<div class="container">
   %{-- ${flash.message}--}%
    <g:if test="${session['user']}">
        </br>
        Login as: ${session['user']} | <g:link controller="myLogout" >Logout</g:link>
    </g:if>
    <g:else>
        %{--<g:form controller="login" action="loginHandler" class="form-signin">--}%
        <form action='${postUrl}' method='POST' id='loginForm' class="form-signin" autocomplete='off'>
            <p>
                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                <input type='text' class='text_' name='j_username' id='username'/>
            </p>

            <p>
                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                <input type='password' class='text_' name='j_password' id='password'/>
            </p>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>
            <p>
                <label><a href="javascript:" id="resetPassword">Forgot password</a></label>
            <label><g:link controller="home" action="home">Registration</g:link></label>
            </p>

            <p>
                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
            </p>
        </form>
       %{-- <g:form method="POST" action="${resource(file: 'j_spring_security_check')}" class="form-signin">
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="email" class="sr-only">Email address</label>
            <input type="email" id="email" name="j_ username" class="form-control" placeholder="Email address" required  autofocus>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="j_password" class="form-control" placeholder="Password" required>
            <div class="checkbox">
                <label><input type="checkbox" value="remember-me"> Remember me</label> </br>
                <label>
                    <a data-toggle="modal" id="resetPassword" >Forgot password</a>
                </label>
        --}%%{--<label><g:link controller="login" action="resetPassword">Forgot password</g:link></label>--}%%{--
            <label><g:link controller="home" action="home">Registration</g:link></label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </g:form>--}%
    </g:else>
</div>
<g:render template="userEmail"></g:render>
</body>
</html>
