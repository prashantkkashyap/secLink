package com.linksharing

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

        render(view: '/search/search', model:[user:user,listTopicPost:searchMap.listTopicPost,topPosts:resources ] )
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
    params
        def topicSearchList = searchService.topicSearhcMethod(params)
    }

    def trendingTopics(){

        def trendingTopicsList = topicService.trandingTopicMethod()
        render(view: 'search/search')
    }
}
