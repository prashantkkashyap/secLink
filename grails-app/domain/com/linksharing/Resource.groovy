package com.linksharing

abstract class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic: Topic]
    static hasMany = [readingitems: ReadingItem, resourceRatings: ResourceRatings]
    static constraints = {
        description(maxSize: 1024)
    }
    static mapping = {
        tablePerHierarchy false
        description type: 'text'
    }
}