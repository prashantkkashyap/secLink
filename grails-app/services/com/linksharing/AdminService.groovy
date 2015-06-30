package com.linksharing

import grails.transaction.Transactional

@Transactional
class AdminService {

    def allUserMethod(User user) {
        List <User>usersList = User.list()
    }

    def activeAndInactiveUsersMethod(User user){

        List <User> userList = User.list()
       // println(userList)
        List <User> activeUsersList = new ArrayList<>()
        List <User> inactiveUsersList  = new ArrayList<>()
        userList.each {it ->
            if(it.active){
                activeUsersList.add(it)
            }else
                inactiveUsersList.add(it)
        }
        [activeUsersList:activeUsersList, inactiveUsersList:inactiveUsersList]
    }
}
