//
//  LoadingVC.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 09/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class LoadingVC: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var activity: UIActivityIndicatorView!

    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.activity.startAnimating()
        }
    }

}

// MARK: - Creatable

extension LoadingVC: Creatable {
    typealias ViewController = LoadingVC
    static var storyboard = "Loading"
}
