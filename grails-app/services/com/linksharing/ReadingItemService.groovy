package com.linksharing

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    def readingItemMethod(User user, def params) {
        println params

        def readingItemResource=Resource.findById(params.id)
        ReadingItem readingItem= ReadingItem.findByUserAndResource(user, readingItemResource)
        if(!readingItem)
        { readingItem = new ReadingItem(user:user, resource:readingItemResource )
          readingItem.isRead = true
        }else if(readingItem.isRead == false){
            readingItem.isRead = true
        }else
            readingItem.isRead = false
        readingItem.save(flush: 'true',failOnError: 'true')
        readingItem
    }
}
