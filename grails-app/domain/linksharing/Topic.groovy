package linksharing

import com.Visibility


class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static belongsTo = [resources:Resource]
    static hasMany =[user:User, subscriptions:Subscription]
    static constraints = {
    }
}
