<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 16/6/15
  Time: 8:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>%{--<script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <meta name="layout" content="header">

    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >

    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>--}%
    %{--<script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>

</head>
<body>
<<div class="container">
        <div class="panel panel-primary" style="margin-top: 7%;">
            <div class="panel panel-heading" >
               <ul>
                <li>Users</li>
                   <li>
                       <form class="navbar-form navbar-right">
                           <div class="form-group">
                               <input class="form-control"  type="search" id="search" placeholder="Search"  />
                           </div>
                       </form>
                   </li>
                   <li>
                       <div class="dropdown">
                           <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                               Users <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                               <li><g:link controller="user" action="list">All Users</g:link></li>
                               <li><g:link controller="user" action="list">Active Users</g:link></li>
                               <li><g:link controller="user" action="list">Inactive Users</g:link></li>
                           </ul>
                       </div>
                   </li>
               </ul>
            </div>
            <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>
                                <g:select from="${com.linksharing.User?.list().id}" name="id" noSelection="${['null':'']}" >
                                    <span class="caret"></span></g:select> Id
                            </th>
                            <th>
                                <g:select from="${com.linksharing.User?.list().userName}" name="userName" noSelection="${['null':'']}" ><span class="caret"></span>
                                </g:select> UserName</th>
                            <th>
                                <g:select from="${com.linksharing.User?.list().email}" name="email" noSelection="${['null':'']}"  ><span class="caret"></span>
                                </g:select> Email</th>
                            <th>
                                <g:select from="${com.linksharing.User?.list().firstName}" name="firstName" noSelection="${['null':'']}" ><span class="caret"></span>
                                </g:select> FirstName</th>
                            <th>
                                <g:select from="${com.linksharing.User?.list().lastName}" name="lastName" noSelection="${['null':'']}" ><span class="caret"></span>
                                </g:select> LastName</th>
                            <th>
                                <g:select from="${com.linksharing.User?.list().active}" name="active" noSelection="${['null':'']}" ><span class="caret"></span>
                                </g:select> Active</th>
                            <th><ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            </ul><span class="caret"></span> Manage</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:if test="${allUsers}">
                            <g:each in="${allUsers}" var="allUser">
                                <tr>
                                    <td>${allUser.id}</td>
                                    <td>${allUser.userName}<g:if test="${allUser.admin==true}"> <b>(Admin)</b></g:if></td>
                                    <td>${allUser.email}</td>
                                    <td>${allUser.firstName}</td>
                                    <td>${allUser.lastName}</td>
                                    <g:if test="${allUser.active == true}">
                                        <td>Yes</td>
                                    </g:if>
                                    <g:elseif test="${!allUser.active}">
                                        <td>No</td>
                                    </g:elseif>
                                    <g:if test="${allUser.active ==true}">
                                        <td><g:link controller="user" action="inactivateUsers" id="${allUser.id}">Deactivate</g:link></td>
                                    </g:if> <g:elseif test="${!allUser.active ==true} || ${!allUser.active}">
                                        <td><g:link  controller="user" action="activateUsers" id="${allUser.id}">Activate</g:link></td>
                                    </g:elseif>
                                </tr>
                            </g:each>
                        </g:if>
                        <g:elseif test="${activeUsersList}">
                            <g:each in="${activeUsersList}" var="activeUsers">
                                <tr>
                                    <td>${activeUsers.id}</td>
                                    <td>${activeUsers.userName}</td>
                                    <td>${activeUsers.email}</td>
                                    <td>${activeUsers.firstName}</td>
                                    <td>${activeUsers.lastName}</td>
                                    <td>${activeUsers.active}</td>
                                    <g:if test="${activeUsers.active ==true}">
                                        <td><g:link controller="user" action="inactivateUsers" id="${activeUsers.id}">Deactivate</g:link></td>
                                    </g:if>
                                </tr>
                            </g:each>
                        </g:elseif>
                        <g:elseif test="${inactiveUsersList}">
                            <g:each in="${inactiveUsersList}" var="inactiveUsers">
                                <tr>
                                    <td>${inactiveUsers.id}</td>
                                    <td>${inactiveUsers.userName}</td>
                                    <td>${inactiveUsers.email}</td>
                                    <td>${inactiveUsers.firstName}</td>
                                    <td>${inactiveUsers.lastName}</td>
                                    <td>${inactiveUsers.active}</td>
                                    <g:if test="${!inactiveUsers.active ==true} || ${!inactiveUsers.active}">
                                        <td><g:link controller="user" action="activateUsers" id="${inactiveUsers.id}">Activate</g:link></td>
                                    </g:if>
                                </tr>
                            </g:each>
                        </g:elseif>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>