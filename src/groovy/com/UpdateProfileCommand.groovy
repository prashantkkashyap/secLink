package com

import grails.validation.Validateable

/**
 * Created by prashant on 12/6/15.
 */
@Validateable
class UpdateProfileCommand {
    String firstName
    String lastName
    String userName
    byte[] photo

    static constraints = {
        photo(nullable: true, max:1024*20)
        userName(blank: false, unique: true, maxSize: 20)
        firstName(maxSize: 15)
        lastName(maxSize: 15)
    }
}
