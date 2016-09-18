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
    
    // MARK: Lifecycle
    
    override func setUp() {
        
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
    
        let expectation = expectationWithDescription("")
        
        let response = NSHTTPURLResponse(URL: NSURL(), statusCode: 600, HTTPVersion: "1.1", headerFields: nil)
        
        CustomURLSession.dataTaskResponse = (data: NSData(), response: response, error: nil)
        
        let url = NSURL(string: "www.stackoverflow.com")
        let session = CustomURLSession.sharedSession()
        
        session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            XCTAssertNotNil(data)
            expectation.fulfill()
            
        }.resume()

    }
}
