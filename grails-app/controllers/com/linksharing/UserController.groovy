package com.linksharing

import com.UpdateProfileCommand
import com.Visibility
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder

class UserController {
    def emailService
    def topicService
    def readingItemService
    def adminService
    def searchService
    def springSecurityService

    def emailInvitation() {
        User user = springSecurityService.currentUser
        println params.topic.name
        emailService.emailInvitation(params)
        redirect(controller: 'dashboard',action: 'dashboard')
    }
    def readingItem(){

         User user= springSecurityService.currentUser
        params
        readingItemService.readingItemMethod(user, params)

        redirect(action:'showUser')

    }
    def list(){
        User user= springSecurityService.currentUser
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
        // User user= springSecurityService.currentUser
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
    @Secured(['ROLE_ADMIN','ROLE_SWITCH_USER'])
    def inactivateUsers (){

        User user = springSecurityService.currentUser
      //  println params

        def userId = User.findById(params.id)
        userId.active=false
        /*LinkedHashSet <User> authList = user.getAuthorities()
         authList.each {role -> if(role.equals("ROLE_ADMIN")){
             userId.active=false
         }}*/
        userId.save(flush: true, failOnError: true)
        redirect(controller: 'user', action: 'list')
    }
    @Secured(['ROLE_ADMIN','ROLE_SWITCH_USER'])
    def activateUsers (){
        User user= springSecurityService.currentUser
        params
        def userId = User.findById(params.id)
            userId.active=true
        /*if((user.getAuthorities().authority as List).get(0).equals("ROLE_ADMIN")){
            userId.active=true
        }*/
        userId.save(flush: true, failOnError: true)
        redirect(controller: 'user', action: 'list')
    }

    def showUser() {
        User user= springSecurityService.currentUser

        //User & Topics Section
        List<Topic> publicTopic = new ArrayList<Topic>()
        if(!((user.getAuthorities().authority as List).get(0).equals("ROLE_ADMIN"))) {
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
        User user= springSecurityService.currentUser
         params.txt
        def topicSearchList = searchService.topicSearchMethod(params.txt,user)
       println topicSearchList
        render(template: '/template/topics' ,model: [topicSearchList:topicSearchList])
    }
    def postsSearch(){
        User user= springSecurityService.currentUser
       println params
        def postSearchList = searchService.postsSearchMethod(params,user)
       // println(postSearchList)
        render(template: '/template/posts', model: [postSearchList:postSearchList])
    }

    def profile() {

        User user= springSecurityService.currentUser
        long totalUserSubscriptions = Subscription.countByUser(user)
        int totalUserTopics = Topic.countByCreatedBy(user)

        List userTopic = Topic.findAllByCreatedBy(user)

        render(view: 'profile', model: [user: user, totalUserSubscriptions: totalUserSubscriptions, totalUserTopics:
                totalUserTopics, userTopic  : userTopic])
    }

    def updateTopicName() {

        User user= springSecurityService.currentUser
        render(params)
        def userTopics = topicService.updateTopic(params, user)

        redirect(controller: 'user', action: 'profile')

    }

    def updateUserProfile(UpdateProfileCommand updateProfileCO) {
        render(params)
        User user= springSecurityService.currentUser
        println user
        // println(".....................${params}")

        user.firstName = updateProfileCO.firstName
        user.lastName = updateProfileCO.lastName
        user.username = updateProfileCO.userName
        String path = grailsApplication.mainContext.servletContext.getRealPath("images/userImage")
        File file = new File("${path}/${user.username}")
        file.bytes=params.image.bytes;
        //user.photo = updateProfileCO.photo
        user.save(flush: 'true', failOnError: 'true')
        redirect(controller: 'user', action: 'profile')
    }

    def updateUserPassword() {
        User user= springSecurityService.currentUser
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
        } else {
           /* MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile image = (CommonsMultipartFile)mpr.getFile("image");*/
           // println(image.properties)
            User user = new User(params)
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.email = params.email
            user.username = params.userName
            user.password = params.password
            user.confirm = params.confirm
           // user.photo.name = params.userName
            user.active = true
            //user.admin = false
            String path = grailsApplication.mainContext.servletContext.getRealPath("images/userImage")
            File file = new File("${path}/${user.username}")
            file.bytes=params.image.bytes;

           /* if(request instanceof MultipartHttpServletRequest) {
                MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
                CommonsMultipartFile image = (CommonsMultipartFile)mpr.getFile("image");
                user.photo = image?.getBytes()
            }*/
            user.save(flush: true, failOnError: true)
            def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority:"ROLE_USER" ).save()
            def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority:"ROLE_ADMIN" ).save()
            SecUserSecRole.create user, userRole, true
            springSecurityService.reauthenticate(user.username, user.password)

            //session['userId'] = user.id
           // println "=============" + user.id + "====================="
          redirect(url:'/myLogin/index')
        }
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