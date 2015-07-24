<%--
  Created by IntelliJ IDEA.
  User: prashant
  Date: 14/6/15
  Time: 12:19 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Subscribed Topics</title>
    <meta name="layout" content="commonHeader">
    <link rel="stylesheet" href="${resource(dir:'css',file: 'bootstrap.min.css')}" >
    %{--<script rel="script" src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
    <script rel="script"  src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>--}%
    <script rel="script"  src="${resource(dir: 'js',file: 'linksharing.js')}"></script>
    <style type="text/css">

    body {font-family: Helvetica,Arial; font-size:12px;}

    form label {display:inline-block ; width:100%;}
    #topics{margin:8% 2% 0% 2%; padding:0%;width:47%;height:auto;border:1px solid black; }
    #posts{margin:0% 2% 0% 2%; padding:0%;width:47%;height: auto; border:1px solid black;
        float: right;clear: both; }
    .inner-container{margin:2%; padding:2%;text-algn:left;}
    input[type="email"],input[type="password"]{width:160px;}

    form input[type="text"],
    form input[type="password"],
    form input[type="email"] {width:160px;}
    form .line{padding:1%}
    form .line.submit{tet-align:right;}
    .heading{font-size:16px;font-weight: bold;border: 1px solid #000000;background-color: #5cb85c;width: auto;height:8%;
        vertical-align: middle;}
    .right {
        float: right;
    }


    img{
        margin-right: 1%;
        height:40px;
        width:40px;
    }
    ul li {
        list-style-type: none;
        display: inline-block;
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
        margin-left: 7%;}
    .liStyle2{
        margin-left: 11%;
    }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#searchPostParticlrTopic").click(function(){
                /*               var query={
                 'query' : $('input[query=query]').val()
                 }*/
                var txt = $('#searchPostParticlrTopicBox').val();
                /* var txt = {
                 query:$('input[query=query]').val()
                 topicId : $('input[topicId=topicId]').val()
                 }*/

                $.ajax({
                    url: "${createLink(controller: 'topic',action: 'postsSearch')}",
                    method: "post",
                    data:{txt:txt},
                    success: function(data){
                        $("#postParticlrTopicSearch").empty();
                        $("#postParticlrTopicSearch").html(data);
                    }
                });
            });
            $(".readAndUnread").click(function(){
                    /* var id = $('.markReadPost').val()*/
                    var id = $(this).attr('id');
                    // console.log(id);
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
<div>
    <div id="posts" class="right">
        <div class="heading" >
            <div class="right" style=" margin-right:2.5%;width: 60%; vertical-align: middle;">
                <g:form controller="search" action="postSearch" class="navbar-form navbar-right">
                    <div class="form-group">
                        <input class="form-control"  type="search"  name="query" value="${params.query}" placeholder="Search"  id="searchPostParticlrTopicBox"/>
                        <input type="hidden" name="topicId" value="${topicResourceList.topic.id[0]}">
                        <input type="button" id="searchPostParticlrTopic" value="Search" name="search">
                    </div>
                </g:form>
            </div>
            <div style="margin: 2% 0% 0% 2%;  vertical-align: middle; width: 40%;">Posts: ${topicResourceList.topic.name[0]}</div>
        </div>
        <div id="postParticlrTopicSearch">
        <g:render template='posts' model="${topicResourceList},${user}" ></g:render>
        </div>
    </div>
</div>
<div>
    <div id="topics">
        <div>
        <g:render template='topics' model="${subscribedList},${user}"></g:render>
        </div>
    </div>
</div>
<div id="fb-root"></div>
%{--<script>
    (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>--}%
<g:render template="sendInvitationMail"></g:render>
</body>
</html>