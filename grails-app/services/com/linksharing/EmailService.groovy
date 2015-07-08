package com.linksharing

import grails.transaction.Transactional

@Transactional
class EmailService {
    def mailService
    def groovyPageRenderer
    def grailsLinkGenerator

    def emailInvitation(def params) {
        mailService.sendMail {
            to params.email
            subject "This is a test mail"
            body "Hello, This is a test mail, how are you?"
        }
    }
    def resetPasswordMethod(User user){
       /* def link = grailsLinkGenerator.serverBaseURL*/
        def content = groovyPageRenderer.render(view : '/template/resetPassword',model:[User:user] )
        mailService.sendMail {
            to user.email
            subject "Linksharing - Reset Password"
            html  (content)
        }

    }
}
