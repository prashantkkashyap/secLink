package com.linksharing

import com.Visibility
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class SearchService {

    def searchMethod(Map params,User user) {
        def listTopicPost =[]
        if (!params.query && user.admin==true) {
            listTopicPost=Topic.list()
        }else {
                 listTopicPost=Topic.createCriteria().listDistinct {
                     and {
                         or {
                             ilike('name',"%${params.query}%")
                             "resources"{
                                 ilike('description',"%${params.query}%")
                             }
                         }
                         eq('visibility',Visibility.PUBLIC)
                     }
                 }
        }

        [listTopicPost:listTopicPost]
        }
    def postSearchMethod(def params){
        def postSerachList = []
           // println(params.topicId.class)
       long topicId = Long.parseLong(params.topicId)

        postSerachList= Resource.createCriteria().listDistinct{
            and{
                    ilike('description',"%${params.query}%")
                "topic"{
                    idEq(topicId)
                }
            }
        }
       // println(postSerachList)
        [postSerachList:postSerachList]
    }
    def postsSearchMethod(def params){
        def postSerachList = []
      //  long topicId = Long.parseLong(params.topicId)

        postSerachList= Resource.createCriteria().listDistinct{
            ilike('description',"%${params.query}%")
        }
       // println(postSerachList)
        [postSerachList:postSerachList]
    }

   def topicSearhcMethod (def params){
        def topicSearchList=[]
       //long topicId = Long.parseLong(params.topicId)
       topicSearchList = Topic.createCriteria().listDistinct {
            and {
                   ilike("name","%${params.query}%")
                    eq('visibility', Visibility.PUBLIC)
            }
       }
        [topicSearchList:topicSearchList]
    }

    def userSearchMethod(def params, User user){
        def userSearchList=[]
        userSearchList = User.createCriteria().listDistinct {
            or{
                ilike("userName","%${params.query}%")
                ilike("fristName","%${params.query}%")
                ilike("lastName","%${params.query}%")
                ilike("email","%${params.query}%")
            }
        }
        [userSearchList:userSearchList]
    }

            /*postList = Resource.list(params)
            postTotal = Resource.count()

        } else {
            postList = Resource.findAllByDescriptionIlike('%'+params.query+'%')
            topicList = Topic.findAllByName('%'+params.query+'%')
        }
        List listTopicPost = postList+topicList
           // postTotal = Resource?.findAllByTopicLikeOrDescriptionLike('%' + params.query + '%', '%' + params.query + '%').size()
      //  print(listTopicPost)*/
}



