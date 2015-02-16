package linksharing

class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    static hasMany = [user:User]
    static belongsTo = [topic:Topic]
    static hasOne = [linkResources:LinkResource,documentsResource:DocumentResource, readingItems:ResourceRating]
    static constraints = {
        description(maxSize: 100)
    }
}
