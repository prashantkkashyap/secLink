package com.linksharing

class DocumentResourceController {

    def index() {}
   /* def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def documentInstance = new DocumentResource()
            documentInstance.filename = file.originalFilename
            documentInstance.filedata = file.getBytes()
            documentInstance.save()
        }
        redirect (action:'')
    }*/
}
