package com.linksharing

class ApplicationTagLib {
    def springSecurityService
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "appTag"

    def totalTopicsCreatedByUser = { attr, body ->
        User user = User.get(springSecurityService.principal.id)
        def userTopics = Topic.countByCreatedBy(user)
        out << userTopics
    }

    def totalSubscribedTopicsUser = { attr, body ->
        User user = User.get(springSecurityService.principal.id)
        def userSubscribedTopics = Subscription.countByUser(user)
        out << userSubscribedTopics
    }
    def userFullName = { attr, body ->
        User user = User.get(springSecurityService.principal.id)
        def fullName = user.firstName + user.lastName
        out << fullName
    }
    def userFirstName = { attr, body ->
        User user = User.get(springSecurityService.principal.id)
        def firstName = user.firstName
        out << firstName
    }
    def useAdminRoleTag ={attr, body ->
        def userList = User.list()
        userList.each {auth -> auth.getAuthorities().each {role -> if(role.equals('ROLE_ADMIN')){
            String admin = "Admin"
        }
        }}
        out<< admin
    }
    /*def visibilityForUserAdmin = { attr, body ->
        User user = User.get(springSecurityService.principal.id)
        if (user || user.admin) {
            if(user.subscriptions.id == user.topics.id){

            }
        }
    }*/
    /*def show = {attr, body ->
        User user = User.get(springSecurityService.principal.id)
        if(attr.topic.createdBy == user || user.admin == true) {
            out << attr
        }
    }*/

}

