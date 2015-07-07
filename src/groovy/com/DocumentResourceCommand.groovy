package com

import com.linksharing.Topic
import grails.validation.Validateable

/**
 * Created by prashant on 9/6/15.
 */
@Validateable
class DocumentResourceCommand {
    String fileName
    String contentType
    Topic topic
    String description

    static constraints  = {
        description type :'text'
        fileName (nullable: false, blank:false)
        contentType(nullable: false,blank: false)
    }

}
