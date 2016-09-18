//
//  SessionStubberTests.swift
//  SessionStubberTests
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import XCTest
@testable import SessionStubber

class SessionStubberTests: XCTestCase {

    // MARK: Properties
    
    var sessionStubber = SessionStubber.sharedSession()
}

// MARK: Data Task Tests

extension SessionStubberTests {

    func testExample() {
    
        let expectation = expectationWithDescription("")
        
        let response = NSHTTPURLResponse(URL: NSURL(), statusCode: 600, HTTPVersion: "1.1", headerFields: nil)
        SessionStubber.dataTaskResponse = (data: NSData(), response: response, error: nil)
        
        let url = NSURL(string: "www.stackoverflow.com")
        let session = SessionStubber.sharedSession()
        
        session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            XCTAssertNotNil(data)
            expectation.fulfill()
            
        }.resume()
    }
}
