package linksharing

class ReadingItem {
    Resource resource
    User user
    Boolean isRead
    static belongsTo = [resource:Resource]
    static constraints = {
    }
}
