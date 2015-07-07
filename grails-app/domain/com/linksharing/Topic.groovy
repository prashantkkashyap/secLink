package com.linksharing

import com.Seriousness
import com.Visibility

class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static hasMany = [subscriptions: Subscription, resources: Resource]
    static belongsTo = [createdBy : User]

    static constraints = {
        name(unique: ('createdBy'))
           }
     def afterInsert (){
        Subscription subscription=new Subscription()
        subscription.seriousness=Seriousness.SERIOUS
        createdBy.addToSubscriptions(subscription)
        this.addToSubscriptions(subscription)
        subscription.save(flash:true, failOnError: true)
    }
}
