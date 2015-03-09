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

    body {font-family: Arial, Helvetica, sans-serif; font-size:12px;}
    #header{background-color: white; height:50px;width:100%;alignment:left;margin:2%;padding:2%;border:1px solid black;}
    form label {display:inline-block ; width:200%;}
    .container{width:50%;margin:2%; padding:2%;text-align:left;border:1px solid black;}
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{margin:2%}
    form .line.submit{text-align:right;}
    .heading{border: 1px solid black; background-color:grey; font-size:14px;margin:0%;padding:0%;}
    .align-right{position: absolute;top: 10px;right:10px;}
    </style>
</head>
<body>
<div>
    <div id="header"><div class="heading">Link Sharing</div> <div><label for="search">Search </label></label><input type="search" id="search"/></div></div>
    <div>
        <div class="container">
            <div>Recent Shares</div>
            <div> <div><img src=""> <h4>Uday Pratap Singh</h4>
                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
            </div> </div>
            <div> <div><img src=""> <h4>Uday Pratap Singh</h4>
                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
            </div> </div>
        </div>
        <div class="container">
            <div>Top Posts <select class="align-right"> <option value="Today">Today</option>
                <option value="week" >Week</option>
                <option value="Month" >Month</option>
                <option value="Year" >Year</option>
            </select></div>
            <div> <div><img src=""> <h4>Uday Pratap Singh</h4>
                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
            </div> </div>
        </div>

        <div class="container">
            <div><h4>Login</h4></div>
            <div>
                <form action="userAuth">
                    <div class="line"><lable for="email/username">Email/Username*:</lable><input type="email" id="email" name="email"/></div>
                    <div class="line"><lable for="password">Password*:</lable><input type="password" id="pwd"/></div>
                    <div><a href="" target="_blank">Forgot password</a></div>
                    <div class="line"><lable for="login">Login</lable><input type="submit" id="login"/></div>
                </form>
            </div>
        </div>
        <div class="container">
            <div><h3>Register</h3></div>
            <form>
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
            </form>
            <g:form name='sign in'></g:form>
        </div>
    </div>
</div>
</body>
</html>
