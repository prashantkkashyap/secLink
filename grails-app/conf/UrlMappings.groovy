class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'myLogin', action: 'index')
       // "/"(controller:'myLogout', action: 'index')
        "500"(view:'/error')
        "/login/$action?"(controller: "index")
        "/logout/$action?"(controller: "index")
    }
}
