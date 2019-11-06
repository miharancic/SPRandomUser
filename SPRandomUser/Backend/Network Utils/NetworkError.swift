//
//  NetworkError.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Foundation

enum NetworkError: Swift.Error {
    case unexpectedData
    case invalidURL
    case badRequest
}
