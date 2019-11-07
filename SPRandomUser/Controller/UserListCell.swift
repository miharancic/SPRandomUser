//
//  UserListCell.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 07/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class UserListCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var age: UILabel!

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        profile.layer.cornerRadius = profile.frame.width * 0.5
    }

    // MARK: API

    func update(with user: UserResult.User) {
        firstName.text = "First name: \(user.name?.first ?? "")"
        lastName.text = "Last name: \(user.name?.last ?? "")"
        age.text = "Age: \(user.dob?.age ?? 0)"
    }
    
}