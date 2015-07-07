package com.linksharing

class SecurityFilters {

    def filters = {
        loged(controller:'*', action:'*') {
            before = {
                /*if (!session['userId'] && !actionName.equals('login')) {
                    redirect(controller: 'user', action: 'register')
                    return false
                }*/
              //  println(controllerName+ " " + actionName)

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
