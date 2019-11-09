//
//  UIImageView+GetImage.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIImageView {
    func getImage(with url: URL?, completion: ((Error?) -> Void)? = nil) {
        ImageStore.shared.retrieveImage(with: url) { [weak self] (result) in
            switch result {
            case .success(let image):
                self?.image = image
                completion?(nil)
            case .failure(let error):
                completion?(error)
            }
        }
    }
}
