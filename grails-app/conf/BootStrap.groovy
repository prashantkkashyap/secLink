import com.Visibility
import com.linksharing.DocumentResource
import com.linksharing.LinkResource
import com.linksharing.ReadingItem
import com.linksharing.Resource
import com.linksharing.ResourceRatings
import com.linksharing.SecRole
import com.linksharing.SecUser
import com.linksharing.SecUserSecRole
import com.linksharing.Subscription
import com.linksharing.Topic
import com.linksharing.User

class BootStrap {

    def init = { servletContext ->

        //createUser()
        createTopic()
        /*createResources()
        createReadingItems()
        createResourceRatings()
        subscribeTopic()*/
        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority:"ROLE_USER" ).save()
        def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority:"ROLE_ADMIN" ).save()
        def switchUserRole = SecRole.findByAuthority("ROLE_SWITCH_USER")?: new SecRole(authority: "ROLE_SWITCH_USER").save()

        def user1 = new User(firstName: "user1", lastName: "Kashyap", email: "abcuser1@gmail.com", username: "user1", password: "12345678", photo: [1, 2, 3, 4, 5], active: true)
        def user2 = new User(firstName: "user2", lastName: "Kashyap2", email: "abcuser2@gmail.com", username: "user2", password: "12345678", photo: [1, 2, 3, 4, 5], active: true)

        user1.save(flush: true, failOnError: true)?: println("...........Error in Saving......................................")
        user2.save(flush: true, failOnError: true)?: println("...........Error in Saving......................................")

        SecUserSecRole.create user1, adminRole, true
        SecUserSecRole.create user1, switchUserRole, true
        SecUserSecRole.create user2, userRole, true
    }
    def createTopic() {
        Topic user1t1 = new Topic(name: "java1", visibility: Visibility.PRIVATE)
        Topic user1t2 = new Topic(name: "java2", visibility: Visibility.PUBLIC)
        Topic user1t3 = new Topic(name: "java3", visibility: Visibility.PUBLIC)
        Topic user1t4 = new Topic(name: "java4", visibility: Visibility.PRIVATE)
        Topic user1t5 = new Topic(name: "java5", visibility: Visibility.PRIVATE)

        Topic user2t1 = new Topic(name: "Grails1", visibility: Visibility.PRIVATE)
        Topic user2t2 = new Topic(name: "Grails2", visibility: Visibility.PUBLIC)
        Topic user2t3 = new Topic(name: "Grails3", visibility: Visibility.PUBLIC)
        Topic user2t4 = new Topic(name: "Grails4", visibility: Visibility.PRIVATE)
        Topic user2t5 = new Topic(name: "Grails5", visibility: Visibility.PRIVATE)

        println("..............$User.count................................")

       User.get(1).addToTopics(user1t1)
                .addToTopics(user1t2)
                .addToTopics(user1t3)
                .addToTopics(user1t4)
                .addToTopics(user1t5)
                .save(flush: true, failOnError: true) ?: println("Error to add topic1")

        User.get(2).addToTopics(user2t1)
                .addToTopics(user2t2)
                .addToTopics(user2t3)
                .addToTopics(user2t4)
                .addToTopics(user2t5)
                .save(flush: true, failOnError: true) ?: println("Error to add topic2")
    }
  /* List <User>createUser(){
       List<User> users =new ArrayList<User>()
       (1..5).each {
            User user = new User(firstName: "Prashant ${it}", lastName: "Kashyap${it}", email: "prashant${it}@gmail.com", userName: "prashantkashyap${it}", password: "12345678")
            user.photo = [1, 2, 3, 4, 5]
            user.admin = true
            user.active = true
            if (user.save(flush: true)) {
                users.add(user)
            } else {
                user.errors.allErrors.each {
                    println it
                }
            }
                   return users
        }
    }

     List<Topic> createTopic(User user, Long id) {
         5.times {
             Topic topic = new Topic()
             topic.createdBy = user
             topic.name = "JAVA${id}"
             topic.visibility="Public"
             user.addToTopics(topic)
                         }
             return topic as List<Topic>
            topic.save(flush: true)
         }
*/
    /*def createUser() {

        User user1 = new User(firstName: "user1", lastName: "Kashyap", email: "abcuser1@gmail.com", userName: "user1", password: "12345678", photo: [1, 2, 3, 4, 5], admin: true, active: true)
        User user2 = new User(firstName: "user2", lastName: "Kashyap", email: "abcuser2@gmail.com", userName: "user2", password: "12345678", photo: [1, 2, 3, 4, 5], admin: false, active: true)
        user1.save(flush: true, failOnError: true)?: println("...........Error in Saving......................................")
        user2.save(flush: true, failOnError: true)?: println("...........Error in Saving.......................................")


        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $User.count")
    }*/
/*

    def createTopic() {
        Topic user1t1 = new Topic(name: "java1", visibility: Visibility.PRIVATE)
        Topic user1t2 = new Topic(name: "java2", visibility: Visibility.PUBLIC)
        Topic user1t3 = new Topic(name: "java3", visibility: Visibility.PUBLIC)
        Topic user1t4 = new Topic(name: "java4", visibility: Visibility.PRIVATE)
        Topic user1t5 = new Topic(name: "java5", visibility: Visibility.PRIVATE)

        Topic user2t1 = new Topic(name: "Grails1", visibility: Visibility.PRIVATE)
        Topic user2t2 = new Topic(name: "Grails2", visibility: Visibility.PUBLIC)
        Topic user2t3 = new Topic(name: "Grails3", visibility: Visibility.PUBLIC)
        Topic user2t4 = new Topic(name: "Grails4", visibility: Visibility.PRIVATE)
        Topic user2t5 = new Topic(name: "Grails5", visibility: Visibility.PRIVATE)

        User.get(1).addToTopics(user1t1)
                .addToTopics(user1t2)
                .addToTopics(user1t3)
                .addToTopics(user1t4)
                .addToTopics(user1t5)
                .save(flush: true, failOnError: true) ?: println("Error to add topic1")

        User.get(2).addToTopics(user2t1)
                .addToTopics(user2t2)
                .addToTopics(user2t3)
                .addToTopics(user2t4)
                .addToTopics(user2t5)
                .save(flush: true, failOnError: true) ?: println("Error to add topic2")
    }

    def createResources() {
        Topic.list().eachWithIndex { topic, index ->
            5.times {
                // CreateLink resource

                LinkResource linkResource = new LinkResource()
                String url = "http://www.grails.com/page${it}"
                String description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry${topic}"


                linkResource.createdBy = topic.createdBy
                linkResource.URL = url
                linkResource.description = description
                topic.addToResources(linkResource)
                linkResource.save(flush: true, failOnError: true)

                // CreateDocument resource

                DocumentResource documentResource = new DocumentResource()
                String fileName = "ABCDDocument${it}"
                String contentType = ".txt"
                String dDescription = "dummyDocumentResource ${topic}"


                documentResource.createdBy = topic.createdBy
                documentResource.fileName = fileName
                documentResource.contentType = contentType
                documentResource.description = dDescription
                topic.addToResources(documentResource)
                documentResource.save(flush: true, failOnError: true)
            }
        }
    }

    def createReadingItems() {

        List allUsers = User.list()

        List allResource = Resource.list()
        int resourceSize = allResource.size()

        allUsers.each {user ->
            int countOfReadingItems=0
            int countOfNotReadingItems=0
            while(countOfReadingItems<3){
                int random = new Random().nextInt(resourceSize)
                Resource resource=allResource.get(random)
                if(!ReadingItem.countByResourceAndUser(resource,user)){
                    ReadingItem readingItem = new ReadingItem()
                    readingItem.isRead =true
                    user.addToReadingItems(readingItem)
                    resource.addToReadingitems(readingItem)
                    readingItem.save(flush: true, failOnError: true)
                countOfReadingItems++
                }
            }
        }
    }

    def createResourceRatings()
        {
            List<Resource> allResources=Resource.list()

            List allUsers=User.list()
            int usersSize=allUsers.size()

            Random random=new Random()
            int randomRating;
            User randomUser;

            allResources.each {resource->
                randomRating=random.nextInt(5)+1

                ResourceRatings resourceRatings=new ResourceRatings()
                resourceRatings.rating=randomRating

                randomUser=allUsers.get(random.nextInt(usersSize))

                randomUser.addToResourceRatings(resourceRatings)
                resource.addToResourceRatings(resourceRatings)

                resourceRatings.save(flush: true,failOnError:true)
            }
        }
    def subscribeTopic(){

   }
*/
    def destroy = {
    }
}
