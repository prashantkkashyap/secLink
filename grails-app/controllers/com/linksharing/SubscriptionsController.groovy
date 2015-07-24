package com.linksharing

class SubscriptionsController {
    def springSecurityService
    def subscriptionService
    def searchService

    /*def subscriptionTopics() {

        User user = User.get(springSecurityService.principal.id)

        def subscribeTopic = Subscription.get(params.id)
        Subscription subscription = new Subscription(params)
        if(user){
            subscription.seriousness = Seriousness.CASUAL
            subscription.user=user
            subscription.topic=subscribeTopic
        }

        subscription.save(flush: 'true', failOnError: 'true')
    }*/
     def subscribedTopics() {
         User user = User.get(springSecurityService.principal.id)
         def subTopic=subscriptionService.subscribedTopicsMethod(user)
         List subTopics=subTopic.subscribedList
         subTopics=subTopics.sort {it -> it.name}

        // println subTopics
         def topicResource =subscriptionService.topicResourcesMethod(user,params)
         topicResource.topicResourceList
         render(view: '/subscriptions/subscribedTopics', model: [user:user,subscribedList: subTopics, topicResourceList:topicResource.topicResourceList])
     }
    def subscribeTopic(){

        User user = User.get(springSecurityService.principal.id)
        params
        def subscribe = subscriptionService.subscribeTopicMethod(user, params)
        redirect(controller:'dashboard' ,action: 'dashboard')
    }
    def unSubscribeTopic(){

        User user = User.get(springSecurityService.principal.id)
        params
        def topicId = Topic.get(params.id)
       // println(topicId.createdById)
       // println topicId.subscriptions.user.id[0]
        if (topicId.createdById == topicId.subscriptions.user.id[0]){
            flash.message = 'User can not be unsubscribe'
            render(view: '/template/alertTemplate', model: [flash: flash.message])
        }else if(topicId.createdById != topicId.subscriptions.user.id[0]) {
            Subscription subscription = Subscription.findByTopicAndUser(topicId, user)
            subscription.delete(flush: true)
            redirect(controller:'dashboard', action: 'dashboard')
        }

    }
  /*  def topicResources(){
        User user = User.get(springSecurityService.principal.id)
        render(params)
       // println(params.id)
        def topicResource =SubscriptionService.topicResourcesMethod(user,params)
        topicResource.topicResourceList
        redirect(controller:'subscriptions',action: 'subscribedTopics', model: [topicResourceList:topicResource.topicResourceList])
    }*/

    def seriousness(){
        User user=User.get(springSecurityService.principal.id)
        def updateSeriousness = subscriptionService.seriousnessMethod(params,user)
            redirect(controller: 'dashboard', action: 'dashboard')
        }
    def postsSearch(){
        User user = User.get(springSecurityService.principal.id)
        println params
        def postSearchList = searchService.particlrTopicPostSearchMethod(params,user)
        // println(postSearchList)
        render(template: 'posts', model: [topicResourceList:postSearchList, user:user])
    }


}

