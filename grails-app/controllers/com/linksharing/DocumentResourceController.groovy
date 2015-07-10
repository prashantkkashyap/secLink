package com.linksharing


import com.DocumentResourceCommand
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DocumentResourceController {

    def shareDocumentResource(DocumentResourceCommand documentResourceCO){

        User user=User.get(session['userId'])
        DocumentResource documentResource = new DocumentResource(params)
        println params

        if(request instanceof MultipartHttpServletRequest)
        {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile uploadedFile = (CommonsMultipartFile)mpr.getFile("file");
           // println uploadedFile.class
            if(!uploadedFile.empty){
                documentResource.contentType = uploadedFile.contentType
                documentResource.createdBy = user
                documentResource.fileName=documentResourceCO.fileName
                documentResource.description=documentResourceCO.description
                documentResource.topic.addToResources(documentResource)
                ReadingItem readingItem = new ReadingItem()
                readingItem.isRead = true
                user.addToReadingItems(readingItem)
                documentResource.addToReadingitems(readingItem)
                //  println readingItem
                documentResource.save(flush: true,failOnError: true)

                def webRootDir = grailsApplication.config.uploadFolder
                def userDir = new File(webRootDir,"/file/${user.id}")
                userDir.mkdirs()
                uploadedFile.transferTo( new File(userDir, uploadedFile.originalFilename))

            }
            if(uploadedFile.empty || uploadedFile==null){
                flash.message ='File can not be Empty'
                render(view: "/template/alertTemplate", model: [flash:flash.message])
            }
        }
        else
            flash.message = 'request is not of type MultipartHttpServletRequest'

        redirect(controller: 'dashboard', action: 'dashboard')
    }
}
