package com.linksharing

import com.Visibility

class HomeController {
    def home() {

        List topRecentPublicPosts =[]
        List topRecentPosts =[]
        topRecentPosts=  Resource.list()
        topRecentPosts.each {it ->
            if (it.topic.visibility == Visibility.PUBLIC)

            {
                topRecentPublicPosts.add(it)
            }
        }
        topRecentPublicPosts=topRecentPosts.reverse()
       // long topRecentPublicPostsCount = topRecentPublicPosts.count()
       //    println topRecentPublicPosts
       // /*def topRecentShares = com.linksharing.Resource.list([max: 2, offset: 0, order: 'desc', sort: 'dateCreated'])*/

        List <List>topPost= ResourceRatings.createCriteria().list() {
            projections {
                groupProperty('resource')
                avg('rating')
            }
        }

            topPost = topPost.sort{it.getAt(1) }
            topPost = topPost.reverse()
            //topPost = topPost.subList(0, 5)
            List<Resource>resources=new ArrayList<Resource>()
            topPost.each{resource->
                resources.add(resource[0])
            }
         render(view:'/home/home', model: [topRecentShares: topRecentPublicPosts,topPosts:resources ])
    }

}



