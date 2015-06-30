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
    $(".editTopic").click(function(){
        $("#editTopicDiv").toggle();
    });
    $(".deleteTopic").click(function(){
        alert("Do you want to delete Topic ?");
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


});
