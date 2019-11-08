//
//  DetailsVC.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class DetailsVC: UIViewController {

    // MARK: Outlets

    private let detailView = UserDetailView()

    // MARK: Properties

    var user: UserResult.User? {
        didSet {
            detailView.update(with: user)
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureLayout()
    }

    // MARK: Helpers

    private func configureUI() {
        navigationItem.title = "User Details"
    }

    private func configureLayout() {
        let layoutGuide = view.safeAreaLayoutGuide
        view.addSubview(detailView, constraints: [
            detailView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 20),
            detailView.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor)
        ])
    }

}
