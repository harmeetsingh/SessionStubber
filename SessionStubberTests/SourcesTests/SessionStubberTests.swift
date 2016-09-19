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
        
        guard let url = NSURL(string: "www.random.test.webstie.com/random") else {
            return NSURL()
        }
        return url
    }()
    
    let randomURLResponse: NSURLResponse? = {
        
        guard let url = NSURL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        return NSURLResponse(URL: url, MIMEType: "mp3", expectedContentLength: 20000, textEncodingName: "UTF-8")
    }()
    
    let randomHTTPURLResponse: NSHTTPURLResponse? = {
        
        guard let url = NSURL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        return NSHTTPURLResponse(URL: url, statusCode: 200, HTTPVersion: "1.1", headerFields: ["mobileId" : "0987654321"])
    }()
    
    let randomData: NSData? = {
        
        let dictionary = ["username" : "harmeet"]
        return NSKeyedArchiver.archivedDataWithRootObject(dictionary)
    }()
    
    let randomError: NSError? = {
        
        return NSError(domain: "www.harmeetsingh.superError", code: -1000, userInfo: ["profileId" : "1234"])
    }()
    
    // MARK: Lifecycle
    
    func testSessionStubber_NotNil(){
        
        XCTAssertNotNil(sessionStubber, "sessionStubber should not be nil")
    }
}

// MARK: Data Task Tests

extension SessionStubberTests {

    // MARK: Mock Response
    
    func testDataTaskWithURL_MockURLResponse_ResponseNotNil() {
    
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseNotNil")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)

        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in

            XCTAssertNotNil(response, "response should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseURLNotNil() {
     
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseURLNotNil")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let url = response?.URL
            
            XCTAssertNotNil(url, "url should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseURLCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseURLCorrectValue")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let urlString = response?.URL?.absoluteString
            
            XCTAssertEqual(urlString, "www.random.test.webstie.com/random", "url should be 'www.random.test.webstie.com/random'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseMIMETypeNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseMIMETypeNotNil")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let mimeType = response?.MIMEType
            
            XCTAssertNotNil(mimeType, "url should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseMIMETypeCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseMIMETypeCorrectValue")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let mimeType = response?.MIMEType
            
            XCTAssertEqual(mimeType, "mp3", "url should be 'mp3'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseExpectedContentLengthCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseExpectedContentLengthCorrectValue")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let expectedContentLength = response?.expectedContentLength
            
            XCTAssertEqual(expectedContentLength, 20000, "expectedContentLength should be 20000")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameNotNil")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let textEncodingName = response?.textEncodingName
            
            XCTAssertNotNil(textEncodingName, "textEncodingName should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameCorrectValue")
        sessionStubber.stubDataTask(_withResponse: randomURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let textEncodingName = response?.textEncodingName
            
            XCTAssertEqual(textEncodingName, "UTF-8", "url should be 'UTF-8'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    // MARK: Mock Response - NSHTTPURLResponse
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue")
        sessionStubber.stubDataTask(_withResponse: randomHTTPURLResponse)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let httpURLresponse = response as? NSHTTPURLResponse
            let statusCode = httpURLresponse?.statusCode
            
            XCTAssertEqual(statusCode, 200, "statusCode should be 200")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
//    
//    func testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue() {
//        
//        let expectation = expectationWithDescription("testDataTaskWithURL_MockResponse_ResponseStatusCodeCorrectValue")
//        sessionStubber.stubDataTask(_withResponse: randomHTTPURLResponse)testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue
//        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
//            
//            let httpURLresponse = response as? NSHTTPURLResponse
//            let statusCode = httpURLresponse?.statusCode
//            
//            XCTAssertEqual(statusCode, 200, "statusCode should be 200")
//            expectation.fulfill()
//            
//            }.resume()
//        
//        waitForExpectationsWithTimeout(0.2, handler: nil)
//    }
//    
    // MARK: Mock Data
    
    func testDataTaskWithURL_MockData_DataNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockData_DataNotNil")
        sessionStubber.stubDataTask(_withData: randomData)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            XCTAssertNotNil(data, "data should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockData_DictionaryCorrectCount() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockData_DictionaryCorrectCount")
        sessionStubber.stubDataTask(_withData: randomData)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            guard let data = data else {
                return XCTFail()
            }
            
            let dictionay = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? NSDictionary
            let dictionaryCount = dictionay?.count
            
            XCTAssertEqual(dictionaryCount, 1, "dictionaryCount should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockData_DataCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockData_DataCorrectValue")
        sessionStubber.stubDataTask(_withData: randomData)
        
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
    
    // MARK: Mock Error
    
    func testDataTaskWithURL_MockError_ErrorNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorNotNil")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            XCTAssertNotNil(error, "error should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorDomainNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorDomainNotNil")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let errorDomain = error?.domain
            
            XCTAssertNotNil(errorDomain, "errorDomain should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorDomainCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorDomainCorrectValue")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let errorDomain = error?.domain
            
            XCTAssertEqual(errorDomain, "www.harmeetsingh.superError", "errorDomain should be 'www.harmeetsingh.superError'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorCodeCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorCodeCorrectValue")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let errorCode = error?.code
            
            XCTAssertEqual(errorCode, -1000, "errorDomain should be -1000")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoNotNil() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorUserInfoNotNil")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let errorUserInfo = error?.userInfo
            
            XCTAssertNotNil(errorUserInfo, "errorUserInfo should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoCorrectCount() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorUserInfoCorrectCount")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let userInfoCount = error?.userInfo.count
            
            XCTAssertEqual(userInfoCount, 1, "userInfoCount should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoCorrectValue() {
        
        let expectation = expectationWithDescription("testDataTaskWithURL_MockError_ErrorUserInfoCorrectValue")
        sessionStubber.stubDataTask(_withError: randomError)
        
        sessionStubber.dataTaskWithURL(randomURL) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            let profileIdValue = error?.userInfo["profileId"] as? String
            
            XCTAssertEqual(profileIdValue, "1234", "profileIdValue should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectationsWithTimeout(0.2, handler: nil)
    }
}