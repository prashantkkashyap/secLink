package com.linksharing

abstract  class Resource {

    String description
    String title
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic]
    static hasMany = [readingitems: ReadingItem, resourceRatings:ResourceRatings]
    static constraints = {
        description(maxSize: 1024)
            }
}