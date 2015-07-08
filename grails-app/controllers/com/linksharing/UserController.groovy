package com.linksharing

import com.UpdateProfileCommand
import com.Visibility

class UserController {
    def emailService
    def topicService
    def readingItemService
    def adminService
    def searchService

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
        if (!user.admin) {
            publicTopic = Topic.findAllByCreatedByAndVisibility(user, Visibility.PUBLIC).each { it}
        } else {
            publicTopic = Topic.findAllByCreatedBy(user).each {it}
        }
        //println(publicTopic)

        // posts Section
        List<Resource> publicTopicResource = new ArrayList<>()
        publicTopic.resources.each { des ->
            publicTopicResource.add(des)
        }
        publicTopicResource = publicTopicResource.flatten()
        publicTopicResource.topic.id


        render(view: 'showUser', model: [user: user, publicTopic: publicTopic, publicTopicResource: publicTopicResource])
    }
    def topicSearch(){
        User user = User.get(session['userId'])
         params.txt
        def topicSearchList = searchService.topicSearchMethod(params.txt,user)
       println topicSearchList
        render(template: '/template/topics' ,model: [topicSearchList:topicSearchList])
    }
    def postsSearch(){
        User user = User.get(session['userId'])
       println params
        def postSearchList = searchService.postsSearchMethod(params,user)
       // println(postSearchList)
        render(template: '/template/posts', model: [postSearchList:postSearchList])
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
        String path = grailsApplication.mainContext.servletContext.getRealPath("images/userImage")
        File file = new File("${path}/${user.userName}")
        file.bytes=params.image.bytes;
        //user.photo = updateProfileCO.photo
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

    }

    def registerHandler() {
       params
        User u = User.findByEmail(params.email)

        if (u) {
            flash.message = "EmailID already exits ${params.email}"
            redirect(controller: 'home', action: 'home')
        } else if (params.password != params.confirm) {
            flash.message = "Password do not match"
            redirect(controller: 'home', action: 'home')
        } else if (request.method=='POST') {
           /* MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile image = (CommonsMultipartFile)mpr.getFile("image");*/
           // println(image.properties)
            User user = new User(params)
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.email = params.email
            user.userName = params.userName
            user.password = params.password
            user.confirm = params.confirm
           // user.photo.name = params.userName
            user.active = true
            user.admin = false
            String path = grailsApplication.mainContext.servletContext.getRealPath("images/userImage")
            File file = new File("${path}/${user.userName}")
            file.bytes=params.image.bytes;

           /* if(request instanceof MultipartHttpServletRequest) {
                MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
                CommonsMultipartFile image = (CommonsMultipartFile)mpr.getFile("image");
                user.photo = image?.getBytes()
            }*/

            user.save(flush: true, failOnError: true)
            session['userId'] = user.id
            println "=============" + user.id + "====================="
            /*def webRootDir = grailsApplication.config.uploadFolder
            def userDir = new File(webRootDir,"/image/${user.id}")
            userDir.mkdirs()
            image.transferTo( new File(userDir, image.originalFilename))*/
            redirect(controller: 'dashboard', action: 'dashboard')
        }
    }
    /*def commandObj {RegisterValidatorCommand registerVlaidatorCO ->
    redirect (controller: 'home', action:'home')
    }*/
/*
    def viewImage() {

        def userImage = User.get(params.id)
        println userImage.photo
        Byte[] image = userImage.photo
        response.outputStream << image // write the image to the outputstream
        response.outputStream.flush()
    }*/

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