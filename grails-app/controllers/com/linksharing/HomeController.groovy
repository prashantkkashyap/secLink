package com.linksharing

class HomeController {

    def index() {}
    def recentShares(){
        Resource.listOrderByDateCreated([max:5,offset:0,order:'desc'])
        render
    }
}
