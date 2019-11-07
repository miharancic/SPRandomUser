//
//  ImageStore.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 07/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

struct ImageStore {

    // MARK: Singleton

    static var shared = ImageStore()

    // MARK: Properties

    var store = NSCache<NSString, UIImage>()

    // MARK: API

    func cache(_ image: UIImage, key: String) {
        store.setObject(image, forKey: key as NSString)
    }

    func load(with key: String) -> UIImage? {
        return store.object(forKey: key as NSString)
    }

}
