package com.linksharing

class ResourceController {
    def springSecurityService

       def viewPost(){
           User user= User.get(springSecurityService.principal.id)
           def userPost = Resource.findById(params.id)
           //println userPost.properties

           def trendingTopic = com.linksharing.ResourceRatings.list([max:1, offset: 0, order: 'desc', sort: 'rating'])

           /*Topic topicId = trendingTopic.resource.topic.id

          def subscribeTopicByUser= Subscription.findByTopicAndUser(topicId,user)
           println subscribeTopicByUser*/

           render(view:'/resource/viewPost', model: [user:user, userPost:userPost.properties, trendingTopic:trendingTopic])
       }

}
