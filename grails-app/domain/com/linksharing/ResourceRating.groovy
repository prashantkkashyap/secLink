package com.linksharing

class ResourceRating {
   // Resource resource
   // User user
    int score
    static belongsTo = [user:User, resource:Resource]
    static constraints = {
    }
}
