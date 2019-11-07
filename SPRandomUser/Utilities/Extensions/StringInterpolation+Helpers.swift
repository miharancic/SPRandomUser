//
//  StringInterpolation+Helpers.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 07/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Foundation

/// - See: https://www.swiftbysundell.com/posts/string-literals-in-swift
extension String.StringInterpolation {
    mutating func appendInterpolation<T>(unwrapping optional: T?) {
        let string = optional.map { "\($0)" } ?? "N/A"
        appendLiteral(string)
    }
}
