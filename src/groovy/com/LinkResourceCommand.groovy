package com

import com.linksharing.Topic
import grails.validation.Validateable

/**
 * Created by prashant on 4/6/15.
 */
@Validateable
class LinkResourceCommand {
    Topic topic
    String description
    String url

    static mapping={
        description type :'text'
    }
  }
