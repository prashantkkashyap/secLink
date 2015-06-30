package com.linksharing

class ReadingItemController {
def readingItemService
    def readingItem(){

        User user=User.get(session['userId'])
        params
        readingItemService.readingItemMethod(user, params)

       /* def readingItemResource=Resource.findById(params.id)
       ReadingItem readingItem= ReadingItem.findByUserAndResource(user, readingItemResource)
        if(!readingItem)
        { readingItem = new ReadingItem(user:user, resource:readingItemResource )
            readingItem.isRead = true
        }
        readingItem.isRead = true
        readingItem.save(flush: 'true',failOnError: 'true')*/

    redirect(controller: 'dashboard', action: 'dashboard')

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