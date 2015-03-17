package com.linksharing

class HomeController {

    def index() {}

    def home() {
        def top2 = com.linksharing.Resource.list([max: 2, offset: 0, order: 'desc', sort: 'dateCreated'])

        List <Resource> topPost5= ResourceRatings.createCriteria().list() {
            projections {
                groupProperty('resource')
                avg('rating')
            }
        }
            topPost5 = topPost5.sort{it.getAt(1) }
            topPost5 = topPost5.reverse()
            topPost5 = topPost5.subList(0, 5)
            List<Resource> resources=new ArrayList<Resource>()
            topPost5.each{resource->
                resources.add(resource[0])
            }
            render(view:'/home/home', model: [top2: top2,topPost5:resources])

    }

}