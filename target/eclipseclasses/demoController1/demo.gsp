<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 20/2/15
  Time: 10:37 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="demolayout" name="layout">
    <title>demo View</title>
</head>

<body>
<label>Hello world</label>
<label> My name is ${name}</label>
<label>my job is ${title}</label>
<a href="/demoController1">click</a><br>

<a href="${createLink(controller:'demoController1', action:'index' )}">click</a><br>

<g:link controller="demoController1" action="index">Grails Click</g:link><br>

createlink...........<g:createLink controller="demoController1"action="index"></g:createLink><br>

<g:resource src="/images/skin" file="database_add.png"></g:resource>

<g:render template="demoTemplate" model='[fullName:name,job:title]'/>

<g:each var="i" in="${(0..100)}">
    <li>Item ${i}</li>
</g:each>
<g:form controller="demoController1" method="post" action="save">
    <g:textField name="firstName" value="${(person.firstName)}"/>
    <g:textField name="lastName"/>
    <g:radio name="male" value="male">Male</g:radio>
    <g:radio name="female" value="Female">Female</g:radio>
    <g:radioGroup values="male,female" name="malefemale">Male Female</g:radioGroup>
</g:form>

</body>
</html>