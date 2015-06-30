package com.linksharing

class DashboardController {
    def readingItemService
    def dashboard() {
        User user = User.get(session['userId'])
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


        def topicCreatedByUser= user.topics.id
        topicCreatedByUser.sort ()
       // println(topicCreatedByUser)

       /* List topicCreatedByUser =[]
        Topic.findAllByCreatedBy(user).each{topic ->
            topicCreatedByUser.add(topic)
        }*/


        // Map userDetails = [user: user,userSubscription:userSubscription,userTopic:userTopic,unreadReources:unreadResources]

        render(view: '/dashboard/dashboard' , model: [user: user, userSubscription: userSubscription, userTopic: userTopic,
                                                     unreadResources: unreadResources, subscriptionUserTopicList:
                subscriptionUserTopicList,topicCreatedByUser:topicCreatedByUser])
    }
    def readingItem(){

        User user=User.get(session['userId'])
        params
        readingItemService.readingItemMethod(user, params)
        redirect(controller: 'dashboard', action: 'dashboard')

    }
}



