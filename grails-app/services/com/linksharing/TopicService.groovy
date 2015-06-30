package com.linksharing

import com.Visibility
import grails.transaction.Transactional
import org.apache.jasper.tagplugins.jstl.core.Param

@Transactional
class TopicService {

    def deleteTopicMethod(User user, def params){

        def topic = Topic.get(params.id)

       if(topic.createdBy?.id == user.id || user.isAdmin() == true){
           topic.delete(flush: true)
       }
    }

    def topicListMethod(User user) {
        List topicListCreatedByUser = []
        topicListCreatedByUser = user.topics.toList()
        List<Topic> topicList = []
        topicList = Topic.createCriteria().listDistinct {
            and {
                Topic.list()
            }
            eq('visibility', Visibility.PUBLIC)
        }
        [topicListCreatedByUser: topicListCreatedByUser, topicList: topicList]
    }

    def updateTopic(def params, User user) {

        def topicId = Topic.findById(params.id)
       // println(topicId)
        topicId.name = params.name
        topicId.save(flush: 'true', failOnError: 'true')
    }

    def trandingTopicMethod(){}

    def topPostMethod(){
    List topPosts = ResourceRatings.createCriteria().listDistinct {
        projections{
            groupProperty('resource')
            avg('rating')
        }
    }
        topPosts = topPosts.sort()
        topPosts=topPosts.reverse()
        topPosts=topPosts.subList(0,5)

        List <Resource> topResource = new ArrayList<Resource>()

        topPosts.each {resource ->
            topResource.add(resource)
        }
        [topResource:topResource]
    }

}
