package com.linksharing

class LoginController {
    def emailService

    // controller -1
    def login() {

    }

    def logout() {
        session.invalidate()
        redirect(controller: 'login', action: 'login')
    }
// controller-3&4

    def loginHandler() {
        def userEmail = params.email
        def userPwd = params.password
        User user = User.findByEmailAndPassword(userEmail, userPwd)
        if (!user) {
        flash.message = "Login Failed"
         redirect(controller: 'home', action: 'home')
        } else if (user.active==true){
        flash.message = 'User Login successfully'
        session['userId'] = user.id
        redirect(controller: 'dashboard', action: 'dashboard')
        } else {
            flash.message ='User is deactivated by Admin !! contact to administration !!!'
            render(view: '/template/alertTemplate' , model:[flash:flash.message])
        }

    }
    def resetPassword(){
        println params

        def user= User.findByEmail(params.email)
        if(!user){
            flash.message= "Email-id is not found !! Please enter correct Email-id"
            render(view: '/template/alertTemplate',model: [flash:flash.message])
        }else if(user.active==false){
            flash.message ='User is deactivated by Admin !! contact to administration !!!'
            render(view: '/template/alertTemplate' , model:[flash:flash.message])
        }else

            emailService.resetPasswordMethod(user, request)
        redirect(controller: 'login',action: 'login')
    }

    /*if(params.email.equals("abcuser1@gmail.com") && params.pwd.equals('12345678')) {
            flash.message = "login succeed"
            session["user"] = params.email
            redirect(controller:'Home',action:'home')
        }else {
            flash.message = "login failed"
            redirect(action:'login')
        }*/

}
