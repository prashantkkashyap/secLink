package com

import grails.validation.Validateable

/**
 * Created by prashant on 2/6/15.
 */
@Validateable
class TopicCommand {
    String name
    Visibility visibility
}
