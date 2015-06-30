package com.linksharing

class ResourceRatings {
    Resource resource
    User user
    int rating = 0
    static belongsTo = [user:User, resource:Resource]
    static constraints = {
    }
}
