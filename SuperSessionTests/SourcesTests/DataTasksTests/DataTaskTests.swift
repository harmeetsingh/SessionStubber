//
//  URLDataTaskTests.swift
//  SuperSession
//
//  Created by Harmeet Singh on 20/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation
import XCTest

class DataTaskTests: XCTestCase {
    
    // MARK: Properties
    
    let randomData: Data? = {
    
        let dictionary = ["username" : "harmeet"]
        return NSKeyedArchiver.archivedData(withRootObject: dictionary)
    }()
    
    let randomURLResponse: URLResponse? = {
        
        guard let url = URL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        
        return URLResponse(url: url, mimeType: "mp3", expectedContentLength: 20000, textEncodingName: "UTF-8")
    }()
    
    let randomError: NSError? = {
        
        return NSError(domain: "www.harmeetsingh.superError", code: -1000, userInfo: ["profileId" : "1234"])
    }()
    
    // MARK: Instantiation
    
    func testURLDataTask_NotNil() {
        
        let urlDataTask = DataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in }
        
        XCTAssertNotNil(urlDataTask, "urlDataTask should not be nil")
    }
}

// MARK: Completion Handler Response

extension DataTaskTests {
    
    func testDataTask_NilResponse_NilData() {
        
        let expectation = self.expectation(description: "testDataTask_NilResponse_NilData")
        
        DataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in
        
            XCTAssertNil(data)
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTask_NilResponse_NilURLResponse() {
        
        let expectation = self.expectation(description: "testDataTask_NilResponse_NilURLResponse")
        
        DataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in
            
            XCTAssertNil(response)
            expectation.fulfill()
            
            }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }

    func testDataTask_NilResponse_NilError() {
        
        let expectation = self.expectation(description: "testDataTask_NilResponse_NilError")
        
        DataTask(response: nil) { (data: Data?, response: URLResponse?, error: NSError?) in
            
            XCTAssertNil(error)
            expectation.fulfill()
            
            }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
}
