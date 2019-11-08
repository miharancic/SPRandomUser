//
//  UIImageView+GetImage.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIImageView {
    func getImage(with url: URL?, then completion: (() -> Void)? = nil) {
        UIImage.cachedOrFetch(from: url, completion: { [weak self] (image, _) in
            self?.image = image
            completion?()
        })
    }
}
