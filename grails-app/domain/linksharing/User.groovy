package linksharing

class User {
    String email
    String userName
    String password
    String firsName
    String lastName
    byte[] photo
    boolean active
    boolean admin
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscriptions: Subscription, readingItems: ReadingItem,resourcdes:Resource, topics:Topic, resourceRatings:ResourceRating]

    static constraints = {
        email(unique: true,email: true)
        password(size:5..15, blank: false)
        photo(max:1024*20)

    }
}
