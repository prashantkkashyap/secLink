<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 22/6/15
  Time: 1:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Edit"></g:layoutTitle></title>
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
    <script rel="script" src="${resource(dir: 'js',file: 'linksharing.js')}"></script>

    <style type="text/css">
    img{
        height:25px;
        width:25px;
    }
    ul li {
        list-style-type: none;
        display: inline-block;
    }
    .modal-header, h4, .close {
        background-color: #5cb85c;
        color:white !important;
        text-align: center;
        font-size: 30px;
    }
    .modal-footer {
        background-color: #f9f9f9;
    }
    </style>
    <g:layoutHead/>
</head>
<body>
<div class="container">
    <div class="modal" id="createTopicModal" role='dialog'>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-pencil"></span>Update Topic</h4>
                </div>
                <div class="modal-body">
                %{-- ${flash.message}
                 <g:if test="${session["user"]}">
                     </br>
                         Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
                 </g:if>
                 <g:else>--}%
                    <g:form controller="topic" action="updateTopicName" id="${totalSubscription.id}">
                        <div class="form-group">
                            <lable for="name">Name*:&nbsp;&nbsp;</lable>
                            <g:textField name="name" id="name" value="${totalSubscription.name}"></g:textField>
                        </div>
                        <div class="line">
                            <g:form name='visibility' controller="topic"  id="${totalSubscription.id}" action="topicVisibility">
                                <g:select name="visibility" onchange="this.form.submit()" from="${com.Visibility}" value="${totalSubscription.visibility}"/>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>
                        <div>
                            <g:form id="${totalSubscription.id}" controller="subscriptions" action="seriousness">
                                <g:select name="seriousness"  onchange="this.form.submit()" from="${com.Seriousness}" value="${totalSubscription.subscriptions.seriousness[0]}"></g:select>
                                <noscript><input type="submit" value="submit"></noscript>
                            </g:form>
                        </div>

                    %{-- <div class="modal-footer">
                         <button type="submit" value="save" class="btn btn-default btn-default pull-left" data-dismiss="modal" >
                             <span class="glyphicon glyphicon-save"></span> Save</button>
                         <button value="cancel" class="btn btn-default btn-default pull-right" data-dismiss="modal">
                             <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                     </div>--}%
                        <div class="modal-footer">
                            <ul>
                                <li class="btn pull-left" ><lable for="save" ></lable><input   type="submit" value ='Save' /></li>
                                <li class="btn pul-right"><lable for="cancel"></lable><input data-dismiss="modal"  type="submit" value ='Cancel' /></li>
                            </ul>
                        </div>
                    </g:form>

                %{-- </g:else>--}%
                </div>
            </div>
        </div>
    </div>
</div>
<g:layoutBody/>
</body>
</html>