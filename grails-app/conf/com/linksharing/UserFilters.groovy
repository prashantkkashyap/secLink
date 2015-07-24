package com.linksharing

class UserFilters {
    def springSecurityService

    def filters = {
        all(controller: '*', action: '*') {
            before = {

            }
            after = { Map model ->
                if (model && springSecurityService.isLoggedIn()){
                    model['user'] = User.get(springSecurityService.principal.id )
                }
            }
            afterView = { Exception e ->

            }
        }
    }
}
