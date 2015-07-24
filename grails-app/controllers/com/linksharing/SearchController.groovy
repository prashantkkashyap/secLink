package com.linksharing

import com.Visibility
import grails.plugin.springsecurity.annotation.Secured

class SearchController {

    def springSecurityService
    def searchService
    def topicService

//    @Secured(['ROLE_ADMIN'])
    def search() {
        User user=springSecurityService.currentUser

        boolean isAdmin
        if((user.getAuthorities().authority as List).get(0).equals("ROLE_ADMIN"))
             isAdmin = true
        else isAdmin = false

        def topicName = params.query
        Map searchMap = searchService.searchMethod(topicName, user, isAdmin)
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

        List <Topic> trendingTopicList
        if(isAdmin.equals(true)){
            trendingTopicList= Resource.createCriteria().list() {

            projections {
                groupProperty('topic')
                count()
            }
         }
        } else if(isAdmin.equals(false)){
            trendingTopicList= Resource.createCriteria().list() {

                projections {
                    groupProperty('topic')
                    count()
                }
                "topic" {
                    eq('visibility', Visibility.PUBLIC)
                }
            }
        }
        trendingTopicList = trendingTopicList.sort{it.getAt(1)}
        trendingTopicList = trendingTopicList.reverse()
       // println(trendingTopicList)
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
        User user=User.get(springSecurityService.principal.id)
        params
        def userList = searchService.userSearchMethod(params,user)
    }
}
