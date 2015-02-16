package linksharing

class LinkResource {
    String url
    static belongsTo = [resources:Resource]
    static constraints = {
    }
}
