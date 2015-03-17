package com.linksharing

class LoginController {

    // controller -1
    def login()
    {

    }

    def logout()
    {
        session.invalidate()
        redirect(controller:'login', action:'login')
    }
// controller-3&4

    def loginHandler()
    {
        def userEmail=params.email
        def userPwd=params.pwd

        User user=User.findByEmailAndPassword(userEmail,userPwd)
        if(!user){
            flash.message="Login Failed"
            redirect(controller:'home',action:'home')
        }else
        {
            flash.message='User Login successfully'
            session['userId']=user.id
            redirect(controller: 'dashboard', action: 'dashboard')
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
}
