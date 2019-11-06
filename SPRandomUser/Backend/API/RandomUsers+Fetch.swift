//
//  RandomUsers+Fetch.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Foundation

extension Network {
    func fetch(page: Int, completion: @escaping APICallback<UserResult>) {
        let request = API.RandomUsers(page: page)
        sendRequest(request, completion: completion)
    }
}

extension Network.API {
    struct RandomUsers: APIRequest {
        var path: String {
            return "api"
        }

        var params: [String : Any] {
            return [
                "page": page,
                "results": 30
            ]
        }

        let page: Int
    }
}
