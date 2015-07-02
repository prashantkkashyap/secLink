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
    <link rel="stylesheet" href="${resource(dir:'css',file: 'dataTable.css')}" >
    <link rel="stylesheet" href="${resource(dir:'css',file: 'dataTable-jquery-ui.css')}" >
   %{-- <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>--}%
    %{--<script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel=" script" src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
    <script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>

    <script >
        $(document).ready(function(){
            $('.user').click(function(){
                var active = {};

                $.ajax({
                    url: "${createLink(controller: "user",action: "ajaxList")}",
                    type: "post",
                    data: {userType:$(this).attr("val")}
                }).done(function(data){
                    console.log(data)
                    $("#renderList").html(data);
                }).fail(function (data) {
                    console.log("fails");
                });
            });

            $('#userTable').dataTable( {
                "scrollY":        200,
                "scrollCollapse": true,
                "jQueryUI":       true
            } );

        });

    </script>

</head>
<body>
<<div class="container">
        <div class="panel panel-primary" style="margin-top: 7%;">
            <div class="panel panel-heading" >
               <ul>
                   <li style="float: right;vertical-align: middle;margin: 1%;">
                       <div class="dropdown">
                           <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                               User   <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                               <li class="user" val="all"><a href="javascript:void(0)">All User</a></li>
                               <li class="user"  val="active"><a href="javascript:void(0)">Active User</a></li>
                               <li class="user" val="inactive"><a href="javascript:void(0)">Inactive User</a></li>
                           </ul>
                       </div>
                   </li>
                   <li><h3>Users</h3></li>

                  %{-- <li style="vertical-align: middle;">
                       <g:form controller="search" action="userSearch   " class="navbar-form navbar-right">
                           <div class="form-group">
                               <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  />
                               <input type="hidden" name="userId" value="${user.id}">
                               <g:submitButton name="search" style="color: #000000;"></g:submitButton>
                           </div>
                       </g:form>
                   </li>--}%
               </ul>
            </div>
            <div class="table-responsive">
                    <table id="userTable"  class="display" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>
                                %{--<g:select from="${com.linksharing.User?.list().id}" name="id" noSelection="${['null':'']}" >--}%
                                    <span class="caret"></span> Id
                            </th>
                           %{-- <th><g:sortableColumn property="userName" title="User Name" defaultOrder="asc" /></th>--}%
                            <th>
                                <span class="caret"></span>UserName</th>
                            <th><span class="caret"></span>Email</th>
                            <th>
                                <span class="caret"></span>FirstName</th>
                            <th>
                               <span class="caret"></span>LastName</th>
                            <th>
                                <span class="caret"></span>Active</th>
                            <th><span class="caret"></span>Manage</th>
                        </tr>
                        </thead>
                        <tbody id="renderList">
                            <g:render template="userList" model="${userList}"></g:render>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>