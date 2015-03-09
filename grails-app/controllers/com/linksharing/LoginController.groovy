package com.linksharing

class LoginController {

    def index() { }
    // controller -1
    def login()
    {
   // render(params.email)

    }

    def logout()
    {
        session.invalidate()
        redirect(action:'login')
    }
// controller-3&4

    def loginHandler()
    {
        if(params.email.equals("abcuser1@gmail.com") && params.pwd.equals('12345678')) {
            flash.message = "login succeed"
            session["user"] = params.email
            redirect(controller:'Home',action:'index')
        }else {
            flash.message = "login failed"
            redirect(action:'login')
        }

    }
}
