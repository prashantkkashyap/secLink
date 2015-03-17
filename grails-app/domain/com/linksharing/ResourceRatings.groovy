package com.linksharing

class ResourceRatings {
    Resource resource
    User user
    int rating
    static belongsTo = [user:User, resource:Resource]
    static constraints = {
    }
}
