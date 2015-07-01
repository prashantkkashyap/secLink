package com.linksharing

import grails.transaction.Transactional

@Transactional
class AdminService {

    def allUserMethod() {
        List <User>usersList = User.list()
    }

    def activeUsersMethod(){

        List <User> userList = User.list()
        // println(userList)
        List <User> usersList  = new ArrayList<>()
        userList.each {it ->
            if(it.active){
                usersList.add(it)
            }
        }
      //  println usersList
        usersList
    }
    def inactiveUsersMethod(){

        List <User> userList = User.list()
        // println(userList)
        List <User> usersList  = new ArrayList<>()
        userList.each {it ->
            if(!it.active || it.active==false){
                usersList.add(it)
            }
        }
       // println usersList
        usersList
    }
}
