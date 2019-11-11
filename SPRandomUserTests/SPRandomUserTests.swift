//
//  SPRandomUserTests.swift
//  SPRandomUserTests
//
//  Created by Mihailo Rancic on 10/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import XCTest

class SPRandomUserTests: XCTestCase {

    var network: Network?
    var apiRequest: Network.API.RandomUsers?

    override func setUp() {
        network = Network()
        apiRequest = Network.API.RandomUsers(page: 1)
    }

    override func tearDown() {
        network = nil
        apiRequest = nil
    }

    func testNonNil() {
        XCTAssertNotNil(network)
        XCTAssertNotNil(apiRequest)
    }

    func testAPIRequest() {
        struct Request: APIRequest {
            var path: String {
                return "path"
            }

            var params: [String : Any] {
                return [
                    "Param": "Value"
                ]
            }
        }

        let request = Request()
        XCTAssertNotNil(request)
        XCTAssertNotNil(request.path)
        XCTAssertNotNil(request.params)
        XCTAssertEqual(request.path, "path")
        XCTAssertEqual(request.params["Param"] as? String, "Value")
    }

    func testResultOnMainThread() {
        let queueExpectation = expectation(description: "Main")
        network?.fetch(page: 1, completion: { (result) in
            if case .success = result {
                dispatchPrecondition(condition: .onQueue(.main))
                queueExpectation.fulfill()
            }
        })

        waitForExpectations(timeout: 2, handler: nil)
    }

    func testGetImage() {
        let imageView = UIImageView()
        let url = URL(string: "https://randomuser.me/api/portraits/med/men/95.jpg")
        let imageExpectation = expectation(description: "ImageGet")
        imageView.getImage(with: url, completion: { (_) in
            imageExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(imageView.image)
    }

    func testGetImageOnMainThread() {
        let imageView = UIImageView()
        let url = URL(string: "https://randomuser.me/api/portraits/med/men/95.jpg")
        let imageExpectation = expectation(description: "Main")
        imageView.getImage(with: url, completion: { (_) in
            dispatchPrecondition(condition: .onQueue(.main))
            imageExpectation.fulfill()
        })

        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(imageView.image)
    }

    func testGetImageError() {
        let imageView = UIImageView()
        let url = URL(string: "https://randomuser.me/api")
        var imageError: Error?
        let imageExpectation = expectation(description: "ImageGet")
        imageView.getImage(with: url, completion: { (error) in
            imageExpectation.fulfill()
            imageError = error
        })

        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(imageError)
    }

}
