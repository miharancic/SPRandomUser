//
//  UserResult.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Foundation

struct UserResult: Decodable {
    let results: [User]?

    struct User: Decodable {
        let name: Name?

        struct Name: Decodable {
            let title: String?
            let first: String?
            let last: String?
        }
    }
}
