package com.linksharing

import com.Visibility
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional
class SearchService {

    def searchMethod(def topicName, User user, Boolean isAdmin) {
        def listTopicPost = []
        if (isAdmin.equals(true)) {
            println isAdmin
            listTopicPost = Topic.createCriteria().list {
                or {
                    ilike('name', "%${topicName ?: ''}%")
                }
            }
        } else  if (isAdmin.equals(false)){
            println isAdmin
            listTopicPost = Topic.createCriteria().listDistinct {
                and {
                    or {
                        ilike('name', "%${topicName}%")
                        "resources" {
                            ilike('description', "%${topicName}%")
                        }
                    }
                    eq('visibility', Visibility.PRIVATE)
                }
            }
        }

        [listTopicPost: listTopicPost]
    }

    def postSearchMethod(def params) {
        def postSerachList = []
        println(params.topicId.class)
        long topicId = Long.parseLong(params.topicId)

        postSerachList = Resource.createCriteria().listDistinct {
            and {
                ilike('description', "%${params.query}%")
                "topic" {
                    idEq(topicId)
                }
            }
        }
        // println(postSerachList)
        postSerachList
    }

    def particlrTopicPostSearchMethod(def params, User user) {
        def postSerachList = []
        // println(params)
        //long topicId = Long.parseLong(params.topicId)
        postSerachList = Resource.createCriteria().listDistinct {
            and {
                ilike('description', "%${params.txt}%")
                /*"topic"{
                    idEq(topicId)
                }*/
            }
        }
        // println(postSerachList)
        postSerachList
    }

    def postsSearchMethod(def params, User user) {
        def postSerachList = []
        //  long topicId = Long.parseLong(params.topicId)

        if((user.getAuthorities().authority as List).get(0).equals("ROLE_ADMIN")) {
            postSerachList = Resource.createCriteria().listDistinct {
                or {
                    ilike('description', "%${params.txt}%")
                    "topic" {
                        ilike('name', "%${params.txt}%")
                    }
                }
            }
        } else {
            postSerachList = Resource.createCriteria().listDistinct {
                or {
                    ilike('description', "%${params.txt}%")
                    and {
                        "topic" {
                            ilike('name', "%${params.txt}%")
                            eq('visibility', Visibility.PUBLIC)
                        }
                    }
                }
            }
        }
        // println(postSerachList)
        postSerachList
    }

    def topicSearchMethod(String txt, User user) {
        def topicSearchList = []
        //long topicId = Long.parseLong(params.topicId)
        if((user.getAuthorities().authority as List).get(0).equals("ROLE_ADMIN")) {
            topicSearchList = Topic.createCriteria().listDistinct {
                ilike("name", "%${txt}%")
            }

        } else {
            topicSearchList = Topic.createCriteria().listDistinct {
                and {
                    ilike("name", "%${txt}%")
                    eq('visibility', Visibility.PUBLIC)
                }
            }
        }
        topicSearchList

    }

    def userSearchMethod(def params, User user) {
        def userSearchList = []
        userSearchList = User.createCriteria().listDistinct {
            or {
                ilike("username", "%${params.query}%")
                ilike("fristName", "%${params.query}%")
                ilike("lastName", "%${params.query}%")
                ilike("email", "%${params.query}%")
            }
        }
        [userSearchList: userSearchList]
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



