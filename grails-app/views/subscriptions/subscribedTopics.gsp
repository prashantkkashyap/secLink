<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 14/6/15
  Time: 12:19 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Subscribed Topics</title>
    <meta name="layout" content="commonHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel="script"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}

    form label {display:inline-block ; width:100%;}
    #topics{margin:8% 2% 0% 2%; padding:0%;width:47%;height:auto;border:1px solid black; }
    #posts{margin:0% 2% 0% 2%; padding:0%;width:47%;height: auto; border:1px solid black;
        float: right;clear: both; }
    .inner-container{margin:2%; padding:2%;text-algn:left;}
    input[type="email"],input[type="password"]{width:160px;}

    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:6%;

    }
    .right {
        float: right;
    }


    img{
        margin-right: 1%;
        height:25px;
        width:25px;
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
        margin-left: 7%;}
    .liStyle2{
        margin-left: 11%;
    }
    </style>
</head>
<body>
<div>
    <div id="posts" class="right">
        <g:render template='posts' model="${topicResourceList},${user}" ></g:render>
    </div>
</div>
<div>
    <div id="topics">
        <g:render template='topics' model="${subscribedList},${user}"></g:render>
    </div>
</div>
</body>
</html>