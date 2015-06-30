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
    <link rel="stylesheet" href=${resource(dir:'css',file: 'bootstrap.min.css')} >
    <link  rel="stylesheet" href=${resource(dir: 'css',file: 'signin.css')} >
</head>
<body>
<nav class="nav navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">LinkSharing</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input class="form-control"  type="search" id="search" placeholder="Search"  />
               </div>
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
    ${flash.message}
    <g:if test="${session['user']}">
        </br>
        Login as: ${session['user']} | <g:link action="logout">Logout</g:link>
    </g:if>
    <g:else>
        <g:form controller="login" action="loginHandler" class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="email" class="sr-only">Email address</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label><input type="checkbox" value="remember-me"> Remember me</label> </br>
            <label><g:link controller="login" action="updateUserPassword">Forgot password</g:link></label>
            <label><g:link controller="home" action="home">Registration</g:link></label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </g:form>
    </g:else>
</div>
</body>
</html>
