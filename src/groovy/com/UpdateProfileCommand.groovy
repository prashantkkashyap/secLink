package com

import grails.validation.Validateable

/**
 * Created by prashant on 12/6/15.
 */
@Validateable
class UpdateProfileCommand {
    String userName
    String firstName
    String lastName
    Byte photo

    static constraints = {
        photo(nullable: true)
      //  username(blank: false, unique: true, maxSize: 20)
        firstName(maxSize: 15)
        lastName(maxSize: 15)
    }
}
