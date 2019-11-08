//
//  UIView+LayoutHelpers.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, constraints: NSLayoutConstraint...) {
        addSubview(view, constraints: Array(constraints))
    }
    func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.activateConstraints(constraints)
    }

    func addSubviews(_ constraints: [UIView: [NSLayoutConstraint]]) {
        constraints.keys.forEach{ addSubview($0) }
        constraints.forEach { $0.activateConstraints($1) }
    }

    func activateConstraints(_ constraints: NSLayoutConstraint...) {
        activateConstraints(Array(constraints))
    }
    func activateConstraints(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
