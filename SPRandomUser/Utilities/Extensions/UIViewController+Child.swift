//
//  UIViewController+Child.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 09/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

/// - See: https://www.swiftbysundell.com/articles/using-child-view-controllers-as-plugins-in-swift/
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
