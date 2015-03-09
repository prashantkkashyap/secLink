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
    #recent-shares{margin:2% 0% 0% 2%; padding:0%;width:60%;height:auto;border:1px solid black;}
    #top-posts{margin:2%; padding:0%;width:60%;border:1px solid black;}
    #login{margin:2%; padding:0%;width:25%;border:1px solid black;alignment:top;}
    #register{margin:2%; padding:0%;width:25%;border:1px solid black}
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
    <div>
        <div id="recent-shares">
            <div class="heading">Recent Shares</div>
            <div class="inner-container"><div> <div><h4>Uday Pratap Singh</h4><div><g:link action="">Grails</g:link></div>
                <div> <img src="web-app/images/businessman.jpg"><div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
                    <div><g:link action="">View Post</g:link></div>
            </div> </div></div>
            <div> <div><h4>Uday Pratap Singh</h4><div><g:link action="">Grails</g:link></div>
                <div><img src="businessman.jpg"> <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
            <div><g:link action="">View Post</g:link></div>
                </div> </div></div>
            </div>
        </div>
        <div id="top-posts">
            <div class="heading">Top Posts<select class="right">
                <option value="Today">Today</option>
                <option value="week" >Week</option>
                <option value="Month" >Month</option>
                <option value="Year" >Year</option>
            </select></div>
            <div class="inner-container">
            <div> <div><h4>Uday Pratap Singh</h4> <div><g:link action="">Grails</g:link></div>
                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
                <div><g:link action="">View Post</g:link></div>
            </div> </div>
                </div>
        </div>

        <div id="login" class="right">
            <div class="heading">Login</div>
            <div class="inner-container">
                ${flash.message}
                <g:if test="${session["user"]}">
                    </br>
                 Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                </g:if>
                <g:else>
                    <g:form action="loginHandler">
                    <div class="line"><lable for="email/username">Email/Username*:&nbsp;&nbsp;</lable><input type="email" id="email" name="email"/></div>
                    <div class="line"><lable for="password">Password*:&nbsp;&nbsp;</lable><input type="password" id="pwd" name="pwd"/></div>
                    <div class="line"><lable for="login"></lable><input type="submit" value ='Login' id="login"/></div>
                    <div><a href="" target="_blank">Forgot password</a></div>
                    </g:form>
                </g:else>
            </div>
        </div>
        <div id="register"  class="right">
            <div class="heading">Register</div>
            <div class="inner-container"><form>
                <div class="line"><label for="fname">First Name: </label><input type="text" id="fname"/></div>
                <div class="line"><label for="lname">Last Name: </label><input type="text" id="lname"/></div>
                <div class="line"><label for="emailid">Email*: </label><input type="email" id="emailid"/></div>
                <div class="line"><label for="username"> Username*: </label><input type="text" id="username" /></div>
                <div class="line"><label for="pwd">Password*: </label><input type="password" id="pwd"/></div>
                <div class="line"><label for="pwd">Confirm Password*: </label><input type="password" id="pwd"/></div>
                <div class="line">
                    <div><label>Gender:</label></div>
                    <div><input type="radio" id="male"/><label for="male">Male</label></div>
                    <div><input type="radio" id="female"/><label for="female">Female</label></div></div>
                <div class="line"><label for="image">Photo</label> <input type="file" id="image"></div>
                <div class="submit"><input type="submit" value="Register"/> </div>
            </form></div>
            <g:form name='sign in'></g:form>
        </div>
    </div>
</div>
</body>
</html>
