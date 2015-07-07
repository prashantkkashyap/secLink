package com.linksharing

import com.Seriousness


class SubscriptionsController {

    def subscriptionService
    def searchService

    /*def subscriptionTopics() {

        User user = User.get(session['userId'])

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
         User user = User.get(session['userId'])
         def subTopic=subscriptionService.subscribedTopicsMethod(user)
         List subTopics=subTopic.subscribedList
         subTopics=subTopics.sort {it -> it.name}

        // println subTopics
         def topicResource =subscriptionService.topicResourcesMethod(user,params)
         topicResource.topicResourceList
         render(view: '/subscriptions/subscribedTopics', model: [user:user,subscribedList: subTopics, topicResourceList:topicResource.topicResourceList])
     }
    def subscribeTopic(){

        User user = User.get(session['userId'])
        params
        def subscribe = subscriptionService.subscribeTopicMethod(user, params)
        redirect(controller:'dashboard' ,action: 'dashboard')
    }
    def unSubscribeTopic(){

        User user = User.get(session['userId'])
        params
        def unSubscribe=subscriptionService.unSubscribeTopicMethod(user, params)

        if (unSubscribe) {
            flash.message = 'User can not be unsubscribe'
            render(view: '/template/alertTemplate', model: [flash: flash.message])
        }
        redirect(controller:'dashboard' ,action: 'dashboard')
    }
  /*  def topicResources(){
        User user = User.get(session['userId'])
        render(params)
       // println(params.id)
        def topicResource =SubscriptionService.topicResourcesMethod(user,params)
        topicResource.topicResourceList
        redirect(controller:'subscriptions',action: 'subscribedTopics', model: [topicResourceList:topicResource.topicResourceList])
    }*/

    def seriousness(){
        User user=User.get(session['userId'])
        def updateSeriousness = subscriptionService.seriousnessMethod(params,user)
            redirect(controller: 'dashboard', action: 'dashboard')
        }
    def postsSearch(){
        User user = User.get(session['userId'])
        println params
        def postSearchList = searchService.particlrTopicPostSearchMethod(params,user)
        // println(postSearchList)
        render(template: 'posts', model: [topicResourceList:postSearchList, user:user])
    }


}

