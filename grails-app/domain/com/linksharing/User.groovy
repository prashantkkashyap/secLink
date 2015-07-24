package com.linksharing

class User extends SecUser {
    String email
    String confirm
    String firstName
    String lastName
    Byte photo
    Boolean active
    Date dateCreated
    Date lastUpdated
    String forgotPassId

    static hasMany = [subscriptions: Subscription, readingItems: ReadingItem,resources:Resource, topics:Topic, resourceRatings:ResourceRatings]

    static transients = ['confirm','photo']

    static constraints = {
        email(blank: false,unique: true, email: true)
     //   password(blank: false, size:8..15)
        photo(nullable: true)
        forgotPassId(nullable: true)
     //   userName(blank: false, unique: true, maxSize: 20)
        firstName(maxSize: 15)
        lastName(maxSize: 15)

        /*password(validator:{val, obj ->
            if (val?.equals(obj.password) ) {
                return 'user.password.dontmatch'
            }
        })*/
        }
    static  mapping = {
        //photo column: "photo", sqlType: "longblob"
    }

}
