<%@ taglib prefix="g" uri="http://grails.codehaus.org/tags" %>
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
    <title>Home</title>
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}
    #header{background-color:forestgreen; height:30px;width:auto;alignment:left;margin:0%;padding:2%;border:1px solid black;}
    form label {display:inline-block ; width:100%;}
    #login{margin:2%; padding:0%;width:25%;border:1px solid black;alignment:top;}
    .inner-container{margin:2%; padding:2%;text-align:left;}
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .header-heading{font-size:32px;margin:0%;padding:0%;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: forestgreen;width: auto;height:6%;}
    .right {
        float: right;
        clear: both;
    }
    img{
        float:left;
        clear: both;
        margin-right: 1%;
        height:50px;
        width:50px;
    }
    </style>
</head>
<body>
<div>
    <div id="header"><div class="header-heading">Link Sharing</div> <div class="right"><label for="search">Search &nbsp;&nbsp;</label><input type="search" id="search"/></div></div>
    <div id="login">
        <div class="heading">Reset Password</div>
        <div class="inner-container">
                    <g:form action="updateUserPassword">
                    <div class="line"><lable for="email/username">Email/Username*:&nbsp;&nbsp;</lable><input type="email" id="email" name="email"/></div>
                    <div class="line"><lable for="password">Password*:&nbsp;&nbsp;</lable><input type="password"  name="pwd"/></div>
                    <div class="line"><lable for="submit"></lable><input type="submit" value ='Submit'/></div>
                    </g:form>
        </div>
    </div>
</div>
</body>
</html>
