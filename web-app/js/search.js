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
                $("#postSearch").empty();
                $("#postSearch").html(data);
            }
        });
    });
});