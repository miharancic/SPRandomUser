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

    private var store = NSCache<NSString, UIImage>()
    private var imageQueue = DispatchQueue(label: "Image.Fetch.Queue", attributes: .concurrent)

    // MARK: API

    func retrieveImage(with url: URL?, completion: @escaping ImageStoreCallback) {
        guard let url = url else {
            completion(.failure(ImageStoreError.invalidURL))
            return
        }
        if let cached = load(with: url.absoluteString) {
            completion(.success(cached))
        } else {
            fetchImage(with: url) { (result) in
                DispatchQueue.main.async {
                    self.handleFetchResult(result, for: url, completion: completion)
                }
            }
        }
    }

    // MARK: Helpers

    private func fetchImage(with url: URL, completion: @escaping ImageStoreCallback) {
        imageQueue.async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    completion(.success(image))
                } else {
                    completion(.failure(ImageStoreError.unexpectedData))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }

    private func handleFetchResult(_ result: Result<UIImage, Error>, for url: URL,
                                   completion: @escaping ImageStoreCallback) {
        switch result {
        case .success(let image):
            cache(image, key: url.absoluteString)
            completion(.success(image))
        case .failure(let error):
            completion(.failure(error))
        }
    }

    private func cache(_ image: UIImage, key: String) {
        store.setObject(image, forKey: key as NSString)
    }

    private func load(with key: String) -> UIImage? {
        return store.object(forKey: key as NSString)
    }

}

// MARK: - ImageStoreCallback, ImageStoreError

extension ImageStore {
    typealias ImageStoreCallback = (Result<UIImage, Error>) -> Void

    enum ImageStoreError: Error {
        case invalidURL
        case unexpectedData
    }
}
