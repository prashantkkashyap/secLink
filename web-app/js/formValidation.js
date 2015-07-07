/**
 * Created by prashant on 6/7/15.
 */
function formValidation (){

    var passid = document.registration.password;
if(password_validation(password,8,15)){

}
}
function password_validation(passid,min,max){
var password_len = passid.value.length
    if(password_len == 0 || password_len ==" " || password_len< min || password_len >max){
        alert("password should not be empty / lenght be between " + min+ "to "+max);
        passid.focus();
    return false;
    }
    return true;
}
