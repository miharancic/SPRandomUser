//
//  Protocol.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Alamofire

typealias APICallback<T> = (Swift.Result<T, Error>) -> Void

protocol APIClient {
    func sendRequest<T: Decodable>(_ request: APIRequest, completion: @escaping APICallback<T>)
}

protocol APIRequest: URLRequestConvertible {
    var path: String { get }
    var params: [String: Any] { get }
}

extension APIRequest {
    func asURLRequest() throws -> URLRequest {
        let base = Configuration.baseAddress
        guard let url = URL(string: "\(base)\(path)") else { throw NetworkError.invalidURL }

        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
        } catch {
            throw NetworkError.badRequest
        }
    }
}
