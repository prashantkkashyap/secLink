package com.linksharing

import com.Seriousness

class Subscription {
    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated
    static belongsTo = [user : User,topic : Topic]

    static constraints = {
            }
}
