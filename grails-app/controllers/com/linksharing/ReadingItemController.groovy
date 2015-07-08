package com.linksharing

import grails.converters.JSON

class ReadingItemController {
def readingItemService
    def readingItem(){

        User user=User.get(session['userId'])
        params
        def readingItem = readingItemService.readingItemMethod(user, params)
        String s=''
          if(readingItem.isRead==true){
              s='Mark as unread'
          }else
              s='Mark as read'
        render([flag:s] as JSON)
    /*redirect(controller: 'dashboard', action: 'dashboard')*/

    }
    /*def unreadingItem (){
        User user=User.get(session['userId'])
        params
        def unreadingResource= Resource.get(params.id)
        ReadingItem readingItem = ReadingItem.findByUserAndResource(user,unreadingResource)
        println readingItem
        readingItem.isRead = false
        user.addToReadingItems(readingItem)
        unreadingResource.addToReadingitems(readingItem)

        unreadingResource.save(flush: 'true')
        readingItem.save(flush: 'true' ,failOnError: 'true')
        redirect(controller: 'dashboard', action: 'dashboard')
    }*/
}