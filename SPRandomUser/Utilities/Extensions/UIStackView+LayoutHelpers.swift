//
//  UIStackView+LayoutHelpers.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubview(_ view: UIView, constraints: NSLayoutConstraint...) {
        addArrangedSubview(view, constraints: Array(constraints))
    }
    func addArrangedSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addArrangedSubview(view)
        view.activateConstraints(constraints)
    }
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
