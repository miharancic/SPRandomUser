//
//  UserListCell.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class UserListCell: UITableViewCell {

    // MARK: Cell Identifier

    static let identifier = "UserListCell"

    // MARK: Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: API

    func update(with user: UserResult.User) {
        guard let name = user.name else { return }

        textLabel?.text = name.first
        detailTextLabel?.text = name.last
    }

}
