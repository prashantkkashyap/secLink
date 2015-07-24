<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 20/7/15
  Time: 4:49 PM
--%>

<%@ page import="com.linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Switch User</title>
</head>

<body>
<br/>
<sec:ifLoggedIn>
    Logged in as <sec:username/>
</sec:ifLoggedIn>
<sec:ifSwitched>
    &nbsp;&nbsp;
    <a href='${request.contextPath}/j_spring_security_exit_user'>
        <b>Resume as <sec:switchedUserOriginalUsername/></b>
    </a>
</sec:ifSwitched>
<sec:ifNotSwitched>
    <sec:ifAllGranted roles='ROLE_SWITCH_USER'>

        <form action='${request.contextPath}/j_spring_security_switch_user' method='POST'><br/>
            Switch to user:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:select from="${com.linksharing.User.list()}" value="${user?.username}" keys="${user?.id}"
                                     name='j_username'/>&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='Switch'/>
            %{--<input type='text' name='j_username'/><br/>
            <input type='submit' value='Switch'/>--}%
        </form>

    </sec:ifAllGranted>
</sec:ifNotSwitched>
</body>
</html>