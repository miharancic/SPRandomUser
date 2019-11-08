//
//  Creatable.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

protocol Creatable {
    associatedtype ViewController
    static var storyboard: String { get }
}

extension Creatable {
    static func create() -> ViewController {
        let storyboard = UIStoryboard(name: self.storyboard, bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! ViewController
        return controller
    }
}
