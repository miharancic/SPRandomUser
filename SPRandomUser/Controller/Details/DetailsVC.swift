//
//  DetailsVC.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit
import MessageUI

final class DetailsVC: UIViewController {

    // MARK: Outlets

    private let detailView = UserDetailView()

    // MARK: Properties

    var user: UserResult.User? {
        didSet {
            detailView.update(with: user)
            detailView.delegate = self
        }
    }

    private lazy var mailComposer: MailComposer = {
        let mc = MailComposer(in: self)
        return mc
    }()

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

// MARK: - UserDetailViewDelegate

extension DetailsVC: UserDetailViewDelegate {
    func didTapEmailLabel(for recepient: String) {
        mailComposer.sendEmail(to: recepient)
    }
}

// MARK: - Creatable

extension DetailsVC: Creatable {
    typealias ViewController = DetailsVC
    static var storyboard = "Details"
}
