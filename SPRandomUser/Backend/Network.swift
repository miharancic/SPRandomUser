//
//  Network.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Alamofire

struct Network: APIClient {

    // MARK: Types

    struct API {}

    // MARK: Properties

    private let sessionManager = Alamofire.SessionManager(configuration: .default)

    // MARK: API

    func sendRequest<T: Decodable>(_ request: APIRequest, completion: @escaping APICallback<T>) {
        sessionManager.request(request).validate().responseJSON { (response) in
            if let data = response.data {
                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(value))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NetworkError.unexpectedData))
            }
        }
    }

}
