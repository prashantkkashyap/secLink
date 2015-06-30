package com.linksharing

import grails.transaction.Transactional

@Transactional
class EmailService {
    def mailService

    def emailInvitation(def params) {
        mailService.sendMail {
            to params.email
            subject "This is a test mail"
            body "Hello, This is a test mail, how are you?"
        }
    }
}
