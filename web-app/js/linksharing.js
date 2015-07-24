$(document).ready(function(){
    $(".sendInvitationMail").click(function(){
         $("#sendInvitationMailModal").modal();
    });
    $(".createTopicModalDiv").click(function(){
        $("#createTopicModal").modal();
    });
    $(".shareLinkModalDiv").click(function(){
        $("#shareLinkModal").modal();
    });
    $(".shareDocumentModalDiv").click(function(){
        $("#shareDocumentModal").modal();
    });

    /*$(".secSwitchUserModalDiv").click(function(){
        console.log ("Hello")
        $("#secSwitchUserModal").modal();
    });*/

    /*$(".editTopic").click(function(){
        $("#editTopicDiv").toggle();
    });*/
    $(".deleteTopic").click(function(){
        alert("Do you want to delete Topic ?");
    });
    $("#resetPassword").click(function(){
        //console.log("hello")
        $("#sendResetPasswordModal").modal();
    });

    function displayAlertMessage(message) {
        var timeOut = 5
        jQuery('#messageBox').text(message).fadeIn()
        jQuery('#messageBox').css("display", "block")
        setTimeout(function() {
            jQuery('#messageBox').fadeOut()
            jQuery('#messageBox').css("display", "none")
        }, timeOut * 1000);
    }
    $('.editDiv').click(function(){
        alert ("Do you want to change Topic Name!!")
       $('.editTopicDiv').show()
    });
    /*$(".readAndUnread").click(function(){
         var id = $('.markReadPost').val()
        var id = $(this).attr('id')
        console.log("iddddddddddd"+id)
        $.ajax({
            url: "${createLink(controller: 'readingItem', action: 'readingItem')}",
            method:'post',
            data: {id:id},
            success:function(data){
                console.log(data.flag)
                $('#'+id).html(data.flag);
            }
        });
    });*/
});



