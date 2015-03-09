package com.linksharing

class User {
    String email
    String userName
    String password
    String firstName
    String lastName
    byte[] photo
    boolean active
    boolean admin
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscriptions: Subscription, readingItems: ReadingItem,resourcdes:Resource, topics:Topic, resourceRatings:ResourceRating]

    static constraints = {
        email(unique: true,email: true)
        password(size:8..15)
        photo(max:1024*20)
        userName(unique: true, maxSize: 20)
        firstName(maxSize: 15)
        lastName(maxSize: 15)

        /*password(validator:{val, obj ->
            if (val?.equals(obj.password) ) {
                return false

            }
        })*/
        }
}
