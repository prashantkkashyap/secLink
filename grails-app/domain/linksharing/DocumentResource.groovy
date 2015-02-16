package linksharing

class DocumentResource {
    String filePath
    static belongsTo = [resources:Resource]
    static constraints = {
    }
}
