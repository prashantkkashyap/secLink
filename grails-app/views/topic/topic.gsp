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
    #topic{margin:2% 0% 0% 2%; padding:0%;width:60%;height:auto;border:1px solid black;float: none;}
    #users{margin:2%; padding:0%;width:60%;border:1px solid black;float: none;}
    #posts{margin:2%; padding:0%;width:30%;float: none;border:1px solid black;}
    .inner-container{margin:0%; padding:0%;text-align:left;}
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
    ul{padding:0%;}
    ul li
    {
        margin: 0%;
        list-style-type: none;
        display: inline-block;
        padding-left: 15px;
    }

    </style>
</head>
<body>
<div>
    <div id="header"><div class="header-heading">Link Sharing</div> <div class="right"><label for="search">Search &nbsp;&nbsp;</label><input type="search" id="search"/></div></div>
    <div>
        <div id="topic">
            <div class="heading">Topic:"Grails"</div>
            <g:render template='topics' collection="${topRecentShares}" var="topRecentShare"></g:render>
        </div>
    </div>
    <div>
        <div id="users">
            <div class="heading">Users:"Grails"</div>
            <g:render template='users' collection="${topRecentShares}" var="topRecentShare"></g:render>
        </div>
    </div>
    <div>
        <div id="posts" class="right">
            <div class="heading">Posts:"Grails"</div>
            <g:render template='posts' collection="${topRecentShares}" var="topRecentShare"></g:render>
        </div>
    </div>

</div>
</body>
</html>
