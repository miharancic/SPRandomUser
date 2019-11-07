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
        let dob: Dob?
        let picture: Picture?
        let nat: String?

        struct Name: Decodable {
            let first: String?
            let last: String?
        }

        struct Dob: Decodable {
            let age: Int?
        }

        struct Picture: Decodable {
            let large: String?
            let medium: String?
        }
    }
}
