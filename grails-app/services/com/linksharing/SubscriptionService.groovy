package com.linksharing

import com.Seriousness
import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def seriousnessMethod(def params, User user) {

        def updateSeriousness = Subscription.get(params.id)
        if(user){
            updateSeriousness.seriousness=params.seriousness
            updateSeriousness.save(flush: true,failOnError: true)
        }
        [updateSeriousness:updateSeriousness]
    }
    def subscribedTopicsMethod(User user){
        List subscribedList =[]
        Subscription.findAllByUser(user).each{it ->
            subscribedList.add(it.topic)
        }
        [subscribedList:subscribedList]
       /*subscribedList.topic?.name.sort()*/
    }

    def topicResourcesMethod(User user,def params){
        Topic topicId = Topic.get(params.id)
        def topicResourceList = Resource.findAllByTopic(topicId)
        //println(topicResourceList)
        topicResourceList = topicResourceList.sort{it -> it.dateCreated}
        //println(topicResourceList)
        [topicResourceList:topicResourceList]
    }

    def subscribeTopicMethod(User user, def params){
        def topicId = Topic.get(params.id)

        Subscription subscription = Subscription.findByTopicAndUser(topicId,user)

        if(!subscription)
            subscription = new Subscription(user: user,topic: topicId)
        subscription.seriousness= Seriousness.CASUAL
        subscription.save(flush: true,failOnError: true)
        }
    def unSubscribeTopicMethod(User user,def params){
       // println(params.id)
        def topicId = Topic.get(params.id)
       // println(topicId.createdById)
       // println user.id

        if(topicId.createdById != user.id) {
            Subscription subscription = Subscription.findByTopicAndUser(topicId, user)
            subscription.delete(flush: true)
        }else {
            return
        }

    }
}
