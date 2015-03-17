package com.linksharing

class DashboardController {


    def dashboard() {
        User user = User.get(session["userId"])
        long userSubscription = Subscription.countByUser(user)
        int userTopic = Topic.countByCreatedBy(user)


        List<Resource> unreadResources = new ArrayList<Resource>()
        Subscription.findAllByUser(user).each { subscription ->
            Resource.findAllByTopic(subscription.topic).each { resource ->
                ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
                if(!readingItem || !readingItem.isRead)
                unreadResources.add(resource)
            }
        }
        List<Subscription> totalSubscriptionUser = new ArrayList<Subscription>()
        Subscription.findAllByUser(user).each {subscription ->
           totalSubscriptionUser.add(subscription.topic)
        }
        /*List<Subscription> totalSubscriptionUser = new ArrayList<Subscription>()
def subscriptions=Subscription.withCriteria{
            eq('user',user)

        }
subscriptions.each{subscription->

	totalSubscriptionUser.add(subscription.topic)
}*/

        // Map userDetails = [user: user,userSubscription:userSubscription,userTopic:userTopic,unreadReources:unreadResources]

        render(view: '/dashboard/dashboard', model: [user: user, userSubscription: userSubscription, userTopic: userTopic, unreadResources: unreadResources, totalSubscriptionUser: totalSubscriptionUser])
        //render(view: '/dashboard/dashboard', model: [userDetails : userDetails])
    }
    }



