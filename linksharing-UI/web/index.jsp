<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 17/2/15
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 17/2/15
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <style type="text/css">

        body {font-family: Arial, Helvetica, sans-serif; font-size:100%;}
        #header{background-color: blue; height:50px;width:100%;vertical-align: middle}
        form label {display:inline-block; width:200%;}
        #container{width:300px;margin:0 auto; alignment: left;}
        form .line{clear:both;}
        form .line.submit{text-align:right;}

    </style>
</head>
<body>
<div id="header"> <h1>Sign up Page for Link Sharing</h1></div>
<div id="container">
    <form>
        <div class="line"><label for="username"> Username*: </label><input type="text" id="username" /></div>
        <div class="line"><label for="pwd">Password*: </label><input type="password" id="pwd"/></div>
        <div class="line"><label for="pwd">Re-Type Password*: </label><input type="password" id="pwd"/></div>
        <div class="line"><label for="fname">First Name: </label><input type="text" id="fname"/></div>
        <div class="line"><label for="lname">Last Name: </label><input type="text" id="lname"/></div>
        <div class="line"><label for="emailid">Email*: </label><input type="email" id="emailid"/></div>
        <div class="line"><label>Gender:</label></div>
        <div class="line"><input type="radio" id="male"/><label for="male">Male</label></div>
        <div class="line"><input type="radio" id="female"/><label for="female">Female</label></div>
        <div class="submit"><input type="submit" value="submit"/> </div>
    </form>
</div>
</body>
</html>

