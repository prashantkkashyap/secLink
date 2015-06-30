package com.linksharing

class User {
    String email
    String userName
    String password
    String confirm
    String firstName
    String lastName
    byte[] photo
    boolean active
    boolean admin
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscriptions: Subscription, readingItems: ReadingItem,resources:Resource, topics:Topic, resourceRatings:ResourceRatings]

    static transients = ['confirm']

    static constraints = {
        email(blank: false,unique: true, email: true)
        password(blank: false, size:8..15)
        photo(nullable: true, max:1024*20)
        userName(blank: false, unique: true, maxSize: 20)
        firstName(maxSize: 15)
        lastName(maxSize: 15)

        /*password(validator:{val, obj ->
            if (val?.equals(obj.password) ) {
                return 'user.password.dontmatch'
            }
        })*/
        }
}
