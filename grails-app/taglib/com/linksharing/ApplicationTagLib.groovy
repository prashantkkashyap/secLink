package com.linksharing

class ApplicationTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "appTag"

    def totalTopicsCreatedByUser = { attr, body ->
        User user = User.get(session['userId'])
        def userTopics = Topic.countByCreatedBy(user)
        out << userTopics
    }

    def totalSubscribedTopicsUser = { attr, body ->
        User user = User.get(session['userId'])
        def userSubscribedTopics = Subscription.countByUser(user)
        out << userSubscribedTopics
    }
    def userFullName = { attr, body ->
        User user = User.get(session['userId'])
        def fullName = user.firstName + user.lastName
        out << fullName
    }
    def userFirstName = { attr, body ->
        User user = User.get(session['userId'])
        def firstName = user.firstName
        out << firstName
    }
    /*def visibilityForUserAdmin = { attr, body ->
        User user = User.get(session['userId'])
        if (user || user.admin) {
            if(user.subscriptions.id == user.topics.id){

            }
        }
    }*/
    def show = {attr, body ->
        User user = User.get(session['userId'])
        if(attr.topic.createdBy == user || user.admin == true) {
            out << attr
        }
    }

}

