//
//  UserDetailView.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class UserDetailView: UIView {

    // MARK: Outlets

    private let mainStack = UIStackView()

    private let imageStack = UIStackView()
    private let image = UIImageView()
    private let email = UILabel()

    private let nameStack = UIStackView()
    private let firstName = UILabel()
    private let lastName = UILabel()
    private let age = UILabel()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    // MARK: API

    func update(with user: UserResult.User?) {
        image.getImage(with: user?.picture?.largeURL)
        email.text = "e-mail: \(unwrapping: user?.email)"
        firstName.text = "First name: \(unwrapping: user?.name?.first)"
        lastName.text = "Last name: \(unwrapping: user?.name?.last)"
        age.text = "Age: \(unwrapping: user?.dob?.age)"
    }

    // MARK: Helpers

    private func configure() {
        configureImageStack()
        configureNameStack()
        configureMainStack()
        configureLayout()
    }

    private func configureImageStack() {
        imageStack.axis = .vertical
        imageStack.distribution = .fillProportionally
        imageStack.alignment = .center
    }

    private func configureNameStack() {
        nameStack.axis = .vertical
        nameStack.distribution = .fillEqually
        nameStack.alignment = .leading
    }

    private func configureMainStack() {
        mainStack.axis = .vertical
        mainStack.distribution = .fillProportionally
        mainStack.alignment = .center
    }

    private func configureLayout() {
        imageStack.addArrangedSubview(image, constraints: [
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
        imageStack.addArrangedSubview(email)
        nameStack.addArrangedSubviews([firstName, lastName, age])
        mainStack.addArrangedSubviews([imageStack, nameStack])

        addSubviews([
            mainStack : [
                mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
                mainStack.topAnchor.constraint(equalTo: topAnchor),
                mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
                mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        ])
    }

}
