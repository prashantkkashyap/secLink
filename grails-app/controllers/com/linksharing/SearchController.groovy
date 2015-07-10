package com.linksharing

import com.Visibility

class SearchController {

    def searchService
    def topicService

    def search() {
        User user=User.get(session['userId'])
        Map searchMap = searchService.searchMethod(params,user)
        searchMap.listTopicPost


       /* def topPost = TopicService.topPostMethod()
        topPost.topResource*/
        List <List>topPost= ResourceRatings.createCriteria().list() {
            projections {
                groupProperty('resource')
                avg('rating')
            }
        }
        //println(topPost)
        topPost = topPost.sort{it.getAt(1) }
        topPost = topPost.reverse()
       // topPost = topPost.subList(0, 5)
        List<Resource>resources=new ArrayList<Resource>()
        topPost.each{resource->
            resources.add(resource[0])
        }

        /*List topicList = Topic.list()
        topicList.each {it ->
            it.name
        }*/

        List <Topic> trendingTopicList = Resource.createCriteria().list() {
            projections {
                groupProperty('topic')
                count()
                }
        }
        trendingTopicList = trendingTopicList.sort{it.getAt(1)}
        trendingTopicList = trendingTopicList.reverse()
        println(trendingTopicList)
        //println(topicList.id)
        render(view: '/search/search', model:[user:user,listTopicPost:searchMap.listTopicPost,topPosts:resources,
                                              trendingTopicList:trendingTopicList ] )
    }
    def postSearch(){
        params
        def postSearchList = searchService.postSearchMethod(params)
    }
    def postsSearch(){
        params
        def postSearchList = searchService.postsSearchMethod(params)
    }
    def topicSearch(){
    println params
        def topicSearchList = searchService.topicSearchMethod(params)
        render(template:'/template/topics' ,model: [topicSearchList:topicSearchList])
    }

   /* def trendingTopics(){
        def trendingTopicList
        trendingTopicList=  Subscription.createCriteria().listDistinct {
            projection{
                groupProperty('topic')
                count('user')
            }
            println(trendingTopicList)
        }


//        def trendingTopicsList = topicService.trandingTopicMethod()
        render(view: 'search/search',model: [trendingTopicList:trendingTopicList])
    }*/
    def userSearch(){
        User user=User.get(session['userId'])
        params
        def userList = searchService.userSearchMethod(params,user)
    }
}
