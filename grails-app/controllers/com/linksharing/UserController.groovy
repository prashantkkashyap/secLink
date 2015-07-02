package com.linksharing

import com.UpdateProfileCommand
import com.Visibility
import grails.validation.Validateable

class UserController {
    def emailService
    def topicService
    def readingItemService
    def adminService

    def emailInvitation() {
        User user = User.findById(session['userId'])
        println params
        emailService.emailInvitation(params)
    }
    def readingItem(){

        User user=User.get(session['userId'])
        params
        readingItemService.readingItemMethod(user, params)

        redirect(action:'showUser')

    }

    /*def list() {
        User user = User.get(session['userId'])

        def allUsers = adminService.allUserMethod(user)
        def activeAndInactiveUsers = adminService.activeAndInactiveUsersMethod(user)
        activeAndInactiveUsers.activeUsersList
        activeAndInactiveUsers.inactiveUsersList

        if (user.admin == true) {
            render(view: 'admin', model: [user: user,allUsers:allUsers,activeUsersList:activeAndInactiveUsers.activeUsersList,
                                          inactiveUsersList:activeAndInactiveUsers.inactiveUsersList])
        } else {
            flash.message = "Accesss denied. Only for Admin "
            redirect(controller: 'dashboard', action: 'dashboard')
        }
    }*/
    def list(){
        User user=User.get(session['userId'])
        String type = params.userType ?: "all"
        def usersList
        if(type == "all")
            usersList = adminService.allUserMethod()
        /*if(type == "active"){
            usersList = adminService.activeUsersMethod()
                   }
        if(type == "inactive")
            usersList = adminService.inactiveUsersMethod()*/

        render(view:'admin',model: [user:user,userList:usersList] )
    }
    def ajaxList(){
        //User user=User.get(session['userId'])
        String type = params.userType ?: "all"
        def usersList
        if(type == "all")
            usersList = adminService.allUserMethod()
        if(type == "active")
            usersList = adminService.activeUsersMethod()
        if(type == "inactive")
            usersList = adminService.inactiveUsersMethod()

        render(template: "userList",model: [userList:usersList] )
    }

    def inactivateUsers (){

        User user = User.get(session['userId'])
        params
        def userId = User.findById(params.id)
        if(user.admin==true){
            userId.active=false
        }
        userId.save(flush: true, failOnError: true)
        redirect(controller: 'user', action: 'list')
    }
    def activateUsers (){

        User user = User.get(session['userId'])
        params
        def userId = User.findById(params.id)
        if(user.admin==true){
            userId.active=true
        }
        userId.save(flush: true, failOnError: true)
        redirect(controller: 'user', action: 'list')
    }




    def showUser() {
        User user = User.get(session['userId'])

        //User & Topics Section
        List<Topic> publicTopic = new ArrayList<Topic>()
        if (!user.isAdmin()) {
            publicTopic = Topic.findAllByCreatedByAndVisibility(user, Visibility.PUBLIC).each { it}
        } else {
            publicTopic = Topic.list()
        }

        // posts Section
        List<Resource> publicTopicResource = new ArrayList<>()
        publicTopic.resources.each { des ->
            publicTopicResource.add(des)
        }
        publicTopicResource = publicTopicResource.flatten()
        println publicTopicResource.topic.id

        render(view: 'showUser', model: [user: user, publicTopic: publicTopic, publicTopicResource: publicTopicResource])
    }

    def profile() {

        User user = User.get(session['userId'])
        long totalUserSubscriptions = Subscription.countByUser(user)
        int totalUserTopics = Topic.countByCreatedBy(user)

        List userTopic = Topic.findAllByCreatedBy(user)

        render(view: 'profile', model: [user: user, totalUserSubscriptions: totalUserSubscriptions, totalUserTopics:
                totalUserTopics, userTopic  : userTopic])
    }

    def updateTopicName() {

        User user = User.get(session['userId'])
        render(params)
        def userTopics = topicService.updateTopic(params, user)

        redirect(controller: 'user', action: 'profile')

    }


    def updateUserProfile(UpdateProfileCommand updateProfileCO) {
        render(params)
        User user = User.get(session['userId'])
        println user
        // println(".....................${params}")

        user.firstName = updateProfileCO.firstName
        user.lastName = updateProfileCO.lastName
        user.userName = updateProfileCO.userName
        user.photo = updateProfileCO.photo
        user.save(flush: 'true', failOnError: 'true')
        redirect(controller: 'user', action: 'profile')
    }

    def updateUserPassword() {
        User user = User.get(session['userId'])
        if (params.password != params.confirm) {
            flash.message = "Password do not Match"
        } else {
            user.password = params.password
            user.confirm = params.confirm
            user.save(flush: 'true', failOnError: 'true')
        }
        redirect(controller: 'user', action: 'Profile')

        /* def user = User.get(params.userId)
         user.password = params.newPassword
         if (!user.save())
             render view: 'updateUserPassword', model: [user: user]
         return*/
    }

    def registerHandler() {
        render params
        User u = User.findByEmail(params.email)
        if (u) {
            flash.message = "EmailID already exits ${params.email}"
            redirect(controller: 'home', action: 'home')
        } else if (params.password != params.confirm) {
            flash.message = "Password do not match"
            redirect(controller: 'home', action: 'home')
        } else if (request.method == 'POST') {
            User user = new User(params)
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.email = params.email
            user.userName = params.userName
            user.password = params.password
            user.confirm = params.confirm
            user.photo = params.fileName
            user.active = true
            user.admin = false

            user.save(flush: true, failOnError: true)
            session['userId'] = user.id
            println "=============" + user.id + "====================="
            redirect(controller: 'dashboard', action: 'dashboard')
        }
    }
    /*def commandObj {RegisterValidatorCommand registerVlaidatorCO ->
    redirect (controller: 'home', action:'home')
    }*/
     def imageUpload() {
         def fileInstance = new File(params)
         def uploadedFile = request.getFile("image")
         fileInstance.image = uploadedFile.getBytes() //converting the file to bytes
         fileInstance.fileName = uploadedFile.originalFilename //getting the file name from the uploaded file
         fileInstance.fileType = uploadedFile.contentType//getting and storing the file type
         fileInstance.save() //Create the record in DB by sending the needed Select command
    }
    def showImage() {
        def fileInstance = File.get(params.id)
        response.outputStream << fileInstance.image // write the image to the outputstream
        response.outputStream.flush()
    }

    class RegisterValidatorCommand {
        String password
        String confirm
        String email

        static constrains = {
            password(validator: { val, obj, errors ->
                if (val?.equals(obj.confirm)) {
                    errors.rejectValue('password', 'noMatch')
                }
            })

        }
    }

}