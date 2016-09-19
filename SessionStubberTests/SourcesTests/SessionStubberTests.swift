//
//  SessionStubberTests.swift
//  SessionStubberTests
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import XCTest

class SessionStubberTests: XCTestCase {

    // MARK: Properties
    
    var sessionStubber = SessionStubber.sharedSession()
    
    let randomURL: NSURL = {
        
        if let url = NSURL(string: "www.random.test.webstie.com/random") {
            return url
        }
        return NSURL()
    }()
    
    let randomData: NSData? = {
        
        let dictionary = ["username" : "harmeet"]
        return NSKeyedArchiver.archivedDataWithRootObject(dictionary)
    }()
}

// MARK: Data Task Tests

extension SessionStubberTests {

    func testDataTaskWithURL_MockResponse_ResponseNotNil() {
    
        let expectation = expectationWithDescription("testDataTaskWithURL_MockResponse_ResponseNotNil")
        let mockResponse = NSURLResponse(URL: randomURL, MIMEType: "", expectedContentLength: 20, textEncodingName: "")
        sessionStubber.stubDataTask(_withData: nil, response: mockResponse, error: nil)

        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in

            XCTAssertNotNil(response, "response should not be nil")
            expectation.fulfill()
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockResponse_ResponseURLNotNil() {
     
        let expectation = expectationWithDescription("testDataTaskWithURL_MockResponse_ResponseURLNotNil")
        let mockResponse = NSURLResponse(URL: randomURL, MIMEType: "", expectedContentLength: 20, textEncodingName: "")
        sessionStubber.stubDataTask(_withData: nil, response: mockResponse, error: nil)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let url = response?.URL
            
            XCTAssertNotNil(url, "url should not be nil")
            expectation.fulfill()
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_RequestSucceeded_URLCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_RequestSucceeded_URLNotNil")
        sessionStubber.stubDataTask(_withData: nil, url: randomURL, statusCode: 200)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let url = response?.URL
            
            XCTAssertNotNil(url, "url should not be nil")
            expectation.fulfill()
            }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_RequestSucceeded_StatusCodeCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_RequestSucceeded_StatusCodeCorrectValue")
        sessionStubber.stubDataTask(_withData: nil, url: randomURL, statusCode: 200)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let httpURLresponse = response as? NSHTTPURLResponse
            let statusCode = httpURLresponse?.statusCode
            
            XCTAssertEqual(statusCode, 200, "statusCode should be 200")
            expectation.fulfill()
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_RequestSucceeded_DataNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_RequestSucceeded_DataNotNil")
        sessionStubber.stubDataTask(_withData: randomData, url: randomURL, statusCode: 200)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            XCTAssertNotNil(data, "data should not be nil")
            expectation.fulfill()
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_RequestSucceeded_DataCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_RequestSucceeded_DataCorrectValue")
        sessionStubber.stubDataTask(_withData: randomData, url: randomURL, statusCode: 200)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            guard let data = data else {
                return XCTFail()
            }
            
            let dictionay = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? NSDictionary
            let usernameValue = dictionay?["username"] as? String
            
            XCTAssertEqual(usernameValue, "harmeet", "userbame should be harmeet")
            expectation.fulfill()
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    
}

// MARK: Helpers

extension SessionStubberTests {
    

}