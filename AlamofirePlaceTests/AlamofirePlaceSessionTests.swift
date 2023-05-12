//
//  AlamofirePlaceSessionTests.swift
//  AlamofirePlaceTests
//
//  Created by Kline,Kris on 5/12/23.
//

import XCTest

@testable import AlamofirePlace

final class AlamofirePlaceSessionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15

        let sessionManager = AlamofirePlaceSession(configuration: configuration)
        
        XCTAssertNotNil(sessionManager)
        XCTAssertEqual(sessionManager.fireplaceWidth, 6)
    }
}
