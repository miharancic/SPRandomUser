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
        let email: String?

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

extension UserResult.User {
    var flag: URL? {
        let code = "\(unwrapping: nat)".lowercased()
        return URL(string: "https://www.countryflags.io/\(code)/flat/64.png")
    }
}

extension UserResult.User.Picture {
    var mediumURL: URL? {
        return URL(string: "\(unwrapping: medium)")
    }
    var largeURL: URL? {
        return URL(string: "\(unwrapping: large)")
    }
}
