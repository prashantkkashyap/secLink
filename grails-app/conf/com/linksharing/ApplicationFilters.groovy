package com.linksharing

class ApplicationFilters {

    def filters = {
      log(controller:'*', action:'*') {
      //  some(uri:"/DummyController") {
        before = {
            log.debug " request parameters: $params"
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
