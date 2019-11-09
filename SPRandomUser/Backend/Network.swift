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
    private let networkQueue = DispatchQueue(label: "Network.Queue", qos: .userInitiated)

    // MARK: API

    func sendRequest<T: Decodable>(_ request: APIRequest, completion: @escaping APICallback<T>) {
        sessionManager.request(request).validate().responseJSON(queue: networkQueue) { (response) in
            DispatchQueue.main.async {
                self.handleResponse(response, completion: completion)
            }
        }
    }

    // MARK: Helpers

    private func handleResponse<T: Decodable>(_ response: DataResponse<Any>, completion: APICallback<T>) {
        if let data = response.data {
            self.handleData(data, completion: completion)
        } else {
            completion(.failure(NetworkError.unexpectedData))
        }
    }

    private func handleData<T: Decodable>(_ data: Data, completion: APICallback<T>) {
        do {
            let value = try JSONDecoder().decode(T.self, from: data)
            completion(.success(value))
        } catch {
            completion(.failure(error))
        }
    }

}
