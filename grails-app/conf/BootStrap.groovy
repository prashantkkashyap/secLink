import com.Visibility
import com.linksharing.DocumentResource
import com.linksharing.LinkResource
import com.linksharing.Resource
import com.linksharing.Topic
import com.linksharing.User

class BootStrap {

    def init = { servletContext ->

        createUser()
        createTopic()
        createResources()
        createReadingItems()
    }
  /* List <User>createUser(){
       List<User> users =new ArrayList<User>()
       (1..5).each {
            User user = new User(firstName: "Prashant ${it}", lastName: "Kashyap${it}", email: "prashant.kr06${it}@gmail.com", userName: "prashantkashyap${it}", password: "123456${it}")
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
    }*/

    /* List<Topic> createTopic(User user, Long id) {
         5.times {
             Topic topic = new Topic()
             topic.createdBy = user
             topic.name = "JAVA${id}",
             user.addToTopics(topic)
             return topic as List<Topic>
         }
     }*/

    def createUser() {

        User user1 = new User(firstName: "user1", lastName: "Kashyap", email: "abcuser1@gmail.com", userName: "user1", password: "12345678", photo: [1, 2, 3, 4, 5], admin: true, active: true)
        User user2 = new User(firstName: "user2", lastName: "Kashyap", email: "abcuser2@gmail.com", userName: "user2", password: "12345678", photo: [1, 2, 3, 4, 5], admin: true, active: true)
        user1.save(flush: true, failOnError: true) ?: println("...........Error in Saving......................................")
        user2.save(flush: true, failOnError: true) ?: println("...........Error in Saving.......................................")

        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $User.count")
    }

    def createTopic() {

        Topic user1t1 = new Topic(name: "java1", visibility: Visibility.PRIVATE)
        Topic user1t2 = new Topic(name: "java2", visibility: Visibility.PUBLIC)
        Topic user1t3 = new Topic(name: "java3", visibility: Visibility.PUBLIC)
        Topic user1t4 = new Topic(name: "java4", visibility: Visibility.PRIVATE)
        Topic user1t5 = new Topic(name: "java5", visibility: Visibility.PRIVATE)


        Topic user2t1 = new Topic(name: "java1", visibility: Visibility.PRIVATE)
        Topic user2t2 = new Topic(name: "java2", visibility: Visibility.PUBLIC)
        Topic user2t3 = new Topic(name: "java3", visibility: Visibility.PUBLIC)
        Topic user2t4 = new Topic(name: "java4", visibility: Visibility.PRIVATE)
        Topic user2t5 = new Topic(name: "java5", visibility: Visibility.PRIVATE)



        User.get(1).addToTopics(user1t1)
                .addToTopics(user1t2)
                .addToTopics(user1t3)
                .addToTopics(user1t4)
                .addToTopics(user1t5)
                .save(flush: true, failOnError: true) ?: println("Error to add topic")

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
                String url = "http://www.xyz.com/page${it}"
                String description = "dummyLinkResource ${topic}"
                String title = "DummyLink${it + 1}"

                linkResource.createdBy = topic.createdBy
                linkResource.URL = url
                linkResource.description = description
                linkResource.title = title
                topic.addToResources(linkResource)
                linkResource.save(flush: true, failOnError: true)

                // CreateDocument resource

                DocumentResource documentResource = new DocumentResource()
                String fileName = "ABCDDocument"
                String contentType = ".txt"
                String dDescription = "dummyDocumentResource ${topic}"
                String dTitle = "DummyLink${it + 1}"

                documentResource.createdBy = topic.createdBy
                documentResource.fileName = fileName
                documentResource.contentType = contentType
                documentResource.description = dDescription
                documentResource.title = dTitle
                topic.addToResources(documentResource)
                documentResource.save(flush: true, failOnError: true)
            }
        }

    }

    def createReadingItems() {

        List allUsers = User.list()
        int userSize = allUsers.size()

        List allResource = Resource.list()
        int resourceSize = allResource.size()


    }


    def destroy = {
    }
}
