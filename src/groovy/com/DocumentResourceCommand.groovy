package com

import com.linksharing.Topic
import grails.validation.Validateable

/**
 * Created by prashant on 9/6/15.
 */
@Validateable
class DocumentResourceCommand {
    String fileName
    Topic topic
    String description

    static mapping={
        description type :'text'
    }

}
