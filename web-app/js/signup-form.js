/**
 * Created by prashant on 10/7/15.
 */
$(document).ready(function () {
       $("#signupForm").validate({
        rules: {
            firstName: "required",
            lastName: "required",
            userName: "required"
            ,
            password: {
                required: true,
                minlength: 8,
                maxlength: 15
            },
            confirm: {
                required: true,
                minlength: 8,
                maxlength: 15,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true
            }
        }
    });
});