package com.linksharing

import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class DashboardController {

    def springSecurityService
    def readingItemService
    def dashboard() {
       User user = springSecurityService.currentUser
        println user
        long userSubscription = Subscription.countByUser(user)
        int userTopic = Topic.countByCreatedBy(user)

        List<Resource> unreadResources = new ArrayList<Resource>()
        Subscription.findAllByUser(user).each { subscription ->
            Resource.findAllByTopic(subscription.topic).each { resource ->
                ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
                if(!readingItem || readingItem.isRead == false  || !readingItem.isRead)
                unreadResources.add(resource)
            }
        }
        //unreadResources = unreadResources.sort {it -> it.dateCreated}
//        unreadResources = unreadResources.reverse()

        List subscriptionUserTopicList = new ArrayList<Subscription>()
        Subscription.findAllByUser(user).each {subscription ->
            subscriptionUserTopicList.add(subscription.topic)
            }

          /*  def topicCreatedByUser = user.topics.id
            topicCreatedByUser= topicCreatedByUser.sort()*/

       // println(topicCreatedByUser)

       // Map userDetails = [user: user,userSubscription:userSubscription,userTopic:userTopic,unreadReources:unreadResources]

        render(view: '/dashboard/dashboard' , model: [user: user, userSubscription: userSubscription, userTopic: userTopic,
                                                     unreadResources: unreadResources, subscriptionUserTopicList:
                subscriptionUserTopicList])
    }
    def secSwitchUser(){
        render(view: '/template/secSwitchUser')
    }
    def readingItem(){

        User user = springSecurityService.currentUser
        params
        readingItemService.readingItemMethod(user, params)
        redirect(controller: 'dashboard', action: 'dashboard')

    }
}



