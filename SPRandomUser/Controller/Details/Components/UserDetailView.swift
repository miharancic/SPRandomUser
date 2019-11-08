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

    private let image = UIImageView()

    private let labelStack = UIStackView()
    private let name = UILabel()
    private let age = UILabel()
    private let email = UILabel()

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
        name.text = "\(unwrapping: user?.name?.last), \(unwrapping: user?.name?.first)"
        age.text = "Age: \(unwrapping: user?.dob?.age)"
        email.text = "\(unwrapping: user?.email)"
    }

    // MARK: Helpers

    private func configure() {
        configureLabelStack()
        configureMainStack()
        configureLayout()
    }

    private func configureLabelStack() {
        labelStack.axis = .vertical
        labelStack.distribution = .fillProportionally
        labelStack.alignment = .leading
        labelStack.spacing = 10
    }

    private func configureMainStack() {
        mainStack.axis = .horizontal
        mainStack.distribution = .equalCentering
        mainStack.alignment = .center
        mainStack.spacing = 20
    }

    private func configureLayout() {
        mainStack.addArrangedSubview(image, constraints: [
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
        labelStack.addArrangedSubviews([name, age])
        mainStack.addArrangedSubview(labelStack)

        addSubviews([
            mainStack : [
                mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
            ],
            email: [
                email.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20),
                email.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        ])
    }

}
