class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')

//        "/sprint/getJSON/"(controller: "sprint", parseRequest: true) {
//            action = [GET: "getJSON"]
//        }


	}
}
