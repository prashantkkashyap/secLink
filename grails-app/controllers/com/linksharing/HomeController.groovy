package com.linksharing

class HomeController {

    def home() {
        def topRecentShares = com.linksharing.Resource.list([max: 2, offset: 0, order: 'desc', sort: 'dateCreated'])

        List <List>topPost= ResourceRatings.createCriteria().list() {
            projections {
                groupProperty('resource')
                avg('rating')
            }
        }
            topPost = topPost.sort{it.getAt(1) }
            topPost = topPost.reverse()
            topPost = topPost.subList(0, 5)
            List<Resource> resources=new ArrayList<Resource>()
            topPost.each{resource->
                resources.add(resource[0])
            }


            render(view:'/home/home', model: [topRecentShares: topRecentShares,topPost:resources])
    }
}