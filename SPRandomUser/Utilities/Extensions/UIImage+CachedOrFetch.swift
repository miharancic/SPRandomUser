//
//  UIImage+CachedOrFetch.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

extension UIImage {
    static func cachedOrFetch(from url: URL?, completion: @escaping (UIImage?, Error?) -> Void) {
        let store = ImageStore.shared
        store.retrieveImage(with: url) { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    completion(image, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
