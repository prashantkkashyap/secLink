package com.linksharing

class ResourceRatingsController {
    def springSecurityService

    def resourceRatings() {

        User user=User.findById(springSecurityService.principal.id)
        def resourcePosts = Resource.findById(params.id)
//            render params
        ResourceRatings resourceRatings=ResourceRatings.findByUserAndResource(user,resourcePosts)
        if(!resourceRatings)
            resourceRatings = new ResourceRatings(user: user,resource:resourcePosts)

        resourceRatings.rating = Integer.parseInt (params.rating)
        resourceRatings.save(flush: true, failOnError: true)

        redirect(controller: 'dashboard', action: 'dashboard')
    }
}
