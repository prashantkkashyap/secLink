package com.linksharing

import com.Visibility
import com.Seriousness
import com.TopicCommand

class TopicController {
    def topicService
    def readingItemService

    def topicDelete(){
        User user = User.get(session['userId'])
        topicService.deleteTopicMethod(user,params)
        redirect(controller: 'dashboard' , action:'dashboard')
    }
    def topicVisibility(){

        User user = User.get(session['userId'])
        def updateVisibility = Topic.get(params.id)
        println(updateVisibility.visibility)
        if(user){
            updateVisibility.visibility = params.visibility
            updateVisibility.save(flush: 'true', failOnError: 'true')
        }

       redirect(controller: 'dashboard', action: 'dashboard')
    }
    def readingItem(){

        User user=User.get(session['userId'])
        params
        readingItemService.readingItemMethod(user, params)

        redirect(controller: 'topic', action: 'showTopic')

    }

    def topicList() {
            User user=User.get(session['userId'])

            Map topicLists = topicService.topicListMethod(user)
        List topicListsCreatedByUser = topicLists.topicListCreatedByUser
       // println(topicListsCreatedByUser)

            render(view: '/topic/topicList', model: [user:user,topicListsCreatedByUser:topicListsCreatedByUser])
    }

    def showTopic(){
        User usr =User.get(session['userId'])
        def topic = Topic.get(params.id)
       // println subscribeTopic

        List <Resource> resourcesList = new ArrayList<Resource>()
        Resource.findAllByTopic(topic).each{resource ->
        resourcesList.add(resource)
        }

        List subscribedUsers = topic.subscriptions*.user
        def subscribedTopic=  Subscription.findAllByTopic(topic)
       // println subscribedTopic

     //   println subscribedUsers.first().firstName
     //   println subscribedUsers.size()

        long totalSubscribeTopic = Subscription.countByTopic(topic)
        int totalTopic = Topic.countByCreatedBy(usr)
        long totalSubscribeUserTopic=Subscription.countByUser(usr)
        int totalUserTopic = Topic.countByCreatedBy(usr)

        render(view: '/topic/showTopic', model: [user: usr, topic:topic.properties, totalSubscribeTopic:totalSubscribeTopic,
                                          totalTopic:totalTopic,totalSubscribeUserTopic:totalSubscribeUserTopic,
                                          totalUserTopic:totalUserTopic,resourcesList:resourcesList,
                                          subscribedUsers:subscribedUsers, subscribedTopic:subscribedTopic])

    }
    def updateTopicName() {

        User user = User.get(session['userId'])
        //render(params)
        def userTopics = topicService.updateTopic(params, user)
    redirect(controller: 'dashboard', action: 'dashboard')
    }

    def createTopicAndSubscribeCreator(TopicCommand topicCO) {
      //  render(params)
        Topic topic = new Topic(params)
        User user = User.get(session['userId'])
        if (user.topics.find { it.name == topicCO.name }) {
            flash.message = "This topic alrady created by user ${user.userName}"
        } else {
            topic.createdBy = user
            topic.name = topicCO.name
            topic.visibility = topicCO.visibility
            user.addToTopics(topic)
            user.save(flush: true, failOnError: true)
            topic.save(flush: true, failOnError: true)
        }
        /*Subscription subscription = new Subscription()
        subscription.seriousness = Seriousness.CASUAL
        subscription.user = user
        subscription.topic =topic
      //user.addToSubscriptions(subscription)
        topic.addToSubscriptions(subscription)
        topic.save(flush: true, failOnError: true)
        subscription.save(flush: true, failOnError: true)*/
        redirect(controller: 'dashboard',action: 'dashboard')
    }
}
