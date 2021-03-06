<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 14/6/15
  Time: 7:29 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <meta name="layout" content="UserProfileHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'signin.css')}" >
    <link type="text/css" rel="stylesheet" href="${resource(dir:'css',file: 'header.css')}">
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script type="text/javascript"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}
    form label {display:inline-block ; width:100%;}
    #topic{margin:2% 0% 0% 2%; padding:0%;width:40%;height:auto;border:1px solid black;float: none;}
    #users{margin:4% 0% 0% 2%; padding:0%;width:40%;border:1px solid black;float: none;}
    #posts{margin:4% 2% 2% 2%; padding:0%;width:53%;float: right;clear: both; border:1px solid black;}
    .inner-container{margin:2%; padding:2%;text-align:left;border: 1px solid #000000; }
    input[type="email"],input[type="password"]{width:160px;}
    form input[type="text"]
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .header-heading{font-size:32px;margin:0%;padding:0%;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:8%;}
    .headingContentDiv{
        width: 35%;margin:1.5% 3%;
    }
    .right {
        float: right;
        clear: both;
    }

    img{
        margin-right: 1%;
        height:40px;
        width:40px;
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
        margin-left: 8%;}
    .liStyle2{
        margin-left: 11%;
    }

    </style>
    <script>
        $(document).ready(function(){
           $("#searchTopic").click(function(){
               console.log("sumi");
/*               var query={
                   'query' : $('input[query=query]').val()
               }*/
               var txt = $('#searchBox').val();
               $.ajax({
                   url: "${createLink(controller: 'user',action: 'topicSearch')}",
                   method: "post",
                   data:{txt:txt},
                   success: function(data){
                       //console.log("ssssssssssssssssssssss"+data);
                       $("#topicSearchList").empty();
                       $("#topicSearchList").html(data);
                      // console.log("sucess............")
                   }
               });
           })
            $("#searchPost").click(function(){
                      /*               var query={
                 'query' : $('input[query=query]').val()
                 }*/
                var txt = $('#searchPostBox').val();
                $.ajax({
                    url: "${createLink(controller: 'user',action: 'postsSearch')}",
                    method: "post",
                    data:{txt:txt},
                    success: function(data){
                        //console.log("ssssssssssssssssssssss"+data);
                        $("#postSearch").empty();
                        $("#postSearch").html(data);
                        // console.log("sucess............")
                    }
                });
            });
            $(".readAndUnread").click(function(){
                /* var id = $('.markReadPost').val()*/
                var id = $(this).attr('id')
                console.log(id)
                $.ajax({
                    url:"${createLink(controller: 'readingItem', action: 'readingItem')}",
                    method:'post',
                    data: {id:id},
                    success:function(data){
                        console.log(data.flag)
                        $('#'+id).html(data.flag);
                    }
                });
            });
        });
    </script>
</head>
<body>
%{--<div id="fb-root"></div>
<script> $(document).read(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>--}%
<div>
    <div id="posts" class="right">
        <div class="heading">
            <div class="right" style=" margin-right:3.5%;">
                <g:form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input class="form-control" type="search"  name="query" value="${params.query}" placeholder="Search" id="searchPostBox"  />
                       %{-- <input type="hidden" name="topicId" value="${publicTopicResource.topic.id}">--}%
                        <input type="button" value="Search" id="searchPost" onchange="" name="search"/>
                    </div>
                </g:form>
            </div>
            <div class="headingContentDiv">Posts</div>
        </div>
        <div id="postSearch">
        <g:render template='posts' model="${publicTopic},${publicTopicResource}"></g:render>
        </div>
    </div>
</div>
<div>
    <div id="users">
        <g:render template='userInfo' model="${user}, ${publicTopic}" ></g:render>
    </div>
</div>
<div>
    <div id="topic" >
        <div class="heading">
            <div style=" margin-right:3.5%;">
                <form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input class="form-control"type="search"  name="query" value="${params.query}" placeholder="Search" id="searchBox" />
                        %{--<input type="hidden" name="topicId" value="${publicTopic.id}">--}%
                        <input type="button" id="searchTopic" value="Search" name="search"/>
                    </div>
                </form>
            </div>
            <div class="headingContentDiv">Topics</div>
        </div>

        <div id="topicSearchList">
       %{-- <g:render template="/template/topics" model="${topicSearchList}" ></g:render>--}%
       <g:render template="topics" model="${publicTopic}" ></g:render>
        </div>
    </div>
</div>

</body>
</html>
