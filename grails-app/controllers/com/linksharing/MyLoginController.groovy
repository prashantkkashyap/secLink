package com.linksharing

import grails.plugin.springsecurity.SpringSecurityUtils

import java.security.MessageDigest

class MyLoginController extends grails.plugin.springsecurity.LoginController {
    def emailService

    // controller -1
    /*def login() {

    }*/
    def auth() {

        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String view = 'login'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }

    /*def logout() {
        session.invalidate()
        redirect(controller: 'login', action: 'login')
    }*/
// controller-3&4

   /* def loginHandler() {
        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority:"ROLE_USER" ).save()
        def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority:"ROLE_ADMIN" ).save()
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

    }*/
    def sendResetPasswordEmail() {

        def user = User.findByEmail(params.email)
        if (!user) {
            flash.message = "Email-id is not found !! Please enter correct Email-id"
            render(view: '/template/alertTemplate', model: [flash: flash.message])
        } else if (user.active == false) {
            flash.message = 'User is deactivated by Admin !! contact to administration !!!'
            render(view: '/template/alertTemplate', model: [flash: flash.message])
        } else {
            def baseURL = "http://" + request.getServerName() +":"+request.getServerPort()+request.getContextPath()
          //  println baseURL
            String passwordResetUrl = ""

            MessageDigest messageDigest = MessageDigest.getInstance("SHA1")
            messageDigest.update(user.username.getBytes())
            String sha1Hex = new BigInteger(1, messageDigest.digest()).toString(16).padLeft(40, '0')
          //  println(sha1Hex)
            user.forgotPassId = sha1Hex
            user.save(flush: true, failOnError: true)
            passwordResetUrl = baseURL + "${createLink(controller: 'myLogin', action: 'resetPasswordPage')}?id=${sha1Hex}"
           // println(passwordResetUrl)
            /*mailService.sendMail {
                to email
                subject "Reset password"
                //body "Password : ${userDetail.password}
                body passwordResetUrl
            }*/
            emailService.sendResetPasswordEmailMethod(user, passwordResetUrl)
        }
            redirect(controller: 'myLogin', action: 'index')

    }
    def resetPasswordPage (){
        println params
        render(view: '/template/resetPassword', model:[params.id=params.id])
    }
    def resetPassword(){
        println params
        List <User> userList= User.list()
        userList.each { user ->
            if (user.forgotPassId == params.id) {
                if (params.password != params.confirm) {
                    flash.message = "Password do not Match"
                    render(view: '/template/alertTemplate', model:[flash: flash.message])
                } else {
                    user.password = params.password
                    user.confirm = params.confirm
                    user.save(flush: 'true', failOnError: 'true')
                    redirect(controller: 'myLogin', action: 'index')
                }
            } else{
                flash.message ="Not authonticate user to change the Password!!"
                render(view: '/template/alertTemplate', model:[flash: flash.message])
            }
        }
    }
}
