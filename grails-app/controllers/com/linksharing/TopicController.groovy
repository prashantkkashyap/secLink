package com.linksharing

class TopicController {

    def index() {}
    def topic(){

        User user = User.get(session["userId"])
        long userSubscription = Subscription.countByUser(user)
        int userTopic = Topic.countByCreatedBy(user)

        List<Subscription> totalSubscriptionUser = new ArrayList<Subscription>()
        Subscription.findAllByUser(user).each {subscription ->
            totalSubscriptionUser.add(subscription.topic)
        }
        render(view: 'topic/topic', model: [totalSubscriptionUser:totalSubscriptionUser])
    }

}
