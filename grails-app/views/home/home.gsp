<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>Home</title>
    <link rel="stylesheet" href=${resource(dir:'css',file: 'bootstrap.min.css')} >
    <link  rel="stylesheet" href=${resource(dir: 'css',file: 'signin.css')} >
    <link type="text/css" rel="stylesheet" href="${resource(dir:'css',file: 'header.css')}">

 <style type="text/css">
   body {font-family: Helvetica,Arial; font-size:12px;}

    #recent-shares{margin:2% 0% 0% 2%; padding:0%;width:63%;height:auto;border:1px solid black; }
    #top-posts{margin:2%; padding:0%;width:63%;border:1px solid black;}
    #loginDiv{margin-right:2%; padding:0%;width:30%;border:1px solid black;alignment:top;
        float: right;clear: both;}
    #register{margin:2%; padding:0%;width:30%;border:1px solid black; float : right;
        clear: both;}
    .inner-container{margin:2%; padding:0%;text-align:left;border: 1px solid #000000;}
    input[type="email"],input[type="password"]{width:160px;}
   form label {display:inline-block ; width:100%;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:4% 0 0 2%}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:6%;}
   #header{
       background-color:forestgreen;alignment: top; height:15%;width:auto;margin:0%;padding:0%;border:1px solid black;}

   .header-heading{font-size:32px;margin:0%;vertical-align: middle; padding-left:2.5%;width:50%;float:left;clear: both;}

   .searchDiv{
       float: right;
       clear: both;
       margin: 0%;
       height: 20px;
       width: 20%;
       padding: 0%;
   }
   .right {
       float: right;
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
   .liStyle{
       margin-left: 6%;}
   .liStyle2{
       margin-left: 15%;
   }
 </style>
    
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
    <div class="col-sm-8">
        <div class="list-group">
            <a href="#" class="list-group-item active">
                <h4 class="list-group-item-heading">Recent Shares</h4>
            </a>
        </div>
    </div>
</div>--}%
<div>
    %{--<div id="header">
        <div class="searchDiv">
            <label for="search">Search &nbsp;&nbsp;</label>
            <input type="search" id="search"/>
        </div>
        <label class="header-heading">LinkSharing</label>
    </div>--}%
    <div id="loginDiv" class="right">
            <div class="heading">Login</div>
            <div class="inner-co1ntainer">
               <g:if test="${session["user"]}">
                    </br>
                 Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                </g:if>
                <g:else>
                    <g:uploadForm controller="login" action="loginHandler">
                        <div class="line">
                            <lable for="email">Email:&nbsp;&nbsp;</lable>
                            <input type="email" id="email" name="email"/>
                        </div>
                        <div class="line">
                            <lable for="password">Password*:&nbsp;&nbsp;</lable>
                            <input type="password" id="password" name="password"/>
                        </div>
                        <div class="line">
                            <lable for="login"></lable>
                            <input type="submit" value ='Login' id="login"/>
                        </div>
                        <div class="line">
                            <a href="" target="_blank">Forgot password</a>
                        </div>
                    </g:uploadForm>
                </g:else>
            </div>
    </div>
    <div id="register"  class="right">
        <div class="heading">User Registration</div>
        <div class="inner-container">
            ${flash.message}
            <g:hasErrors bean="${user}">
                <div>
                    <g:renderErrors bean="${user}"/>
                </div>
            </g:hasErrors>
            <g:uploadForm controller="user" action="registerHandler" enctype="multipart/form-data">
                <fieldset>
                    <div class="line">
                        <label for="firstName">First Name: </label>
                        <g:textField name="firstName" value="${user?.firstName}"
                                     class="${hasErrors(bean:user,field:'firstName','errors')}" />
                    </div>
                    <div class="line">
                        <label for="lastName">Last Name: </label>
                        <g:textField name="lastName" value="${user?.lastName}"
                                     class="${hasErrors(bean:user,field:'lastName','errors')}" />
                    </div>
                    <div class="line">
                        <label for="email">Email*: </label>
                        <g:textField name="email" value="${user?.email}"
                                     class="${hasErrors(bean: user,field: 'email','errors')}"/>
                    </div>
                    <div class="line">
                        <label for="userName"> Username*: </label>
                        <input type="text" name="userName" id="${hasErrors(bean:user,field:'userName','errors')}" value="${user?.userName}"/>
                    </div>
                    <div class="line">
                        <label for="password">Password*: </label>
                        <g:passwordField name="password"
                                         class="${hasErrors(bean:registerHandler,field:'password','errors')}" />
                    </div>
                    <div class="line">
                        <label for="confirm">Confirm Password*: </label>
                        <g:passwordField name="confirm"
                                         class="${hasErrors(bean:registerHandler,field:'password','errors')}" />
                    </div>
                    <div class="line"><label for="image">Photo</label>
                        <input type="file" id="image" name="image">
                    </div>
                    <div class="line">
                        <g:submitButton name="submitButton" value="Register" />
                    </div>
                </fieldset>
            </g:uploadForm>
        </div>
    </div>
        <div id="recent-shares">
            <div class="heading">Recent Shares</div>
            <g:render template='recentShares' model="${topRecentPublicPostsCount}"/>

            %{--<g:render template='recentShares' collection="${topRecentShares}" var="topRecentShare">
            </g:render>--}%
        </div>
        <div id="top-posts">
            <div class="heading">
               <span>Top Posts</span>
                <select style="alignment:right;">
                    <option value="Today">Today</option>
                    <option value="week" >Week</option>
                    <option value="Month">Month</option>
                    <option value="Year">Year</option>
                </select>
            </div>
            <div class="inner-container">
            <g:render template="topPosts" model="[topPost:topPost]"></g:render>
            </div>
        </div>
    </div>
</body>
</html>
