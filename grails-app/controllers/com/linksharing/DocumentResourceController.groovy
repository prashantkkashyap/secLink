package com.linksharing


import com.DocumentResourceCommand
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DocumentResourceController {

    def shareDocumentResource(DocumentResourceCommand documentResourceCO){
        User user=User.get(session['userId'])
        DocumentResource documentResource = new DocumentResource(params)
        documentResource.createdBy = user
        documentResource.fileName=documentResourceCO.fileName
        documentResource.description=documentResourceCO.description
        //def CommonsMultipartFile uploadFile = params.documentFile    SpringSecurity Concept
       // documentResource.contentType = uploadFile.contentType
        documentResource.save(flush: true, failOnError: true)
        documentResource.topic.addToResources(documentResource)

        ReadingItem readingItem = new ReadingItem()
        readingItem.isRead = true
        user.addToReadingItems(readingItem)
        documentResource.addToReadingitems(readingItem)
      //  println readingItem
        documentResource.save(flush: true,failOnError: true)

        redirect(controller: 'dashboard', action: 'dashboard')
    }
}
