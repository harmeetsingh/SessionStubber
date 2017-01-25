//
//  URLDataTaskTests.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 20/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation
import XCTest

class URLDataTaskTests: XCTestCase {
    
    // MARK: Properties
    
   // let mockDataTaskResponse: DataTaskResponse = (data: randomData(), response: randomURLResponse(), error: randomError())
    
    // MARK: Lifecycle
    
    func testURLDataTask_NotNil() {
        
        let urlDataTask = URLDataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in
        }
        
        XCTAssertNotNil(urlDataTask, "urlDataTask should not be nil")
    }
}

// MARK: Completion Handler Response

extension URLDataTaskTests {
    
    func testURLDataTask_CustomResponseNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsNotNil")
        
        URLDataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in
        
            XCTAssertNotNil(data)
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
}

extension URLDataTaskTests {
    
    func randomData() -> Data? {
        
        let dictionary = ["username" : "harmeet"]
        return NSKeyedArchiver.archivedData(withRootObject: dictionary)
    }
    
    func randomURLResponse() -> URLResponse? {
        
        guard let url = URL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        return URLResponse(url: url, mimeType: "mp3", expectedContentLength: 20000, textEncodingName: "UTF-8")
    }
    
    func randomError() -> NSError? {
        
        return NSError(domain: "www.harmeetsingh.superError", code: -1000, userInfo: ["profileId" : "1234"])
    }
}
