//
//  UIImageView+CachedOrFetchImage.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 07/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIImageView {
    func cachedOrFetchImage(from url: URL?) {
        guard let url = url else { return }
        let imageStore = ImageStore.shared
        if let cachedImage = imageStore.load(with: url.absoluteString) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    imageStore.cache(image, key: url.absoluteString)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
