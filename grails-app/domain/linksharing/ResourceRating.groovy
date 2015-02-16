package linksharing

class ResourceRating {
    Resource resource
    User user
    int score
    static belongsTo = [user:User]
    static constraints = {
    }
}
