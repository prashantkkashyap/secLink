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
            subject "Invitation of Linksharing Topic - ${params.topic.name}"
            body "Please accept the invitation of Linksharing topic"
        }
    }
    def sendResetPasswordEmailMethod(User user, String link){
       // def link = grailsLinkGenerator.serverBaseURL

      //  def content = groovyPageRenderer.render(view : '/template/resetPassword', model: [link:link])
        mailService.sendMail {
            to user.email
            subject "Linksharing - Reset Password"
            body link
        }

    }
}
