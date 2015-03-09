package com.linksharing

class ApplicationFilters {

    def filters = {
      // all(controller:'DummyController', action:'index') {
        some(uri:"/DummyController") {
        before = {
            println("..........before filter.........")

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
