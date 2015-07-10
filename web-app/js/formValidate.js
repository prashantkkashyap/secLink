/**
 * Created by prashant on 10/7/15.
 */
$(document).ready(function () {
       $("#form").validate({
        rules: {
            name: "required",
            email: {
                required: true,
                email: true
            },
            url: "required",
            description: "required"
        },
        messages: {
            name: "Please fill out field",
            description: "Please write description"
        }
    });
});
