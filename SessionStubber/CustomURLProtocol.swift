//
//  CustomURLProtocol.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

typealias MockResponse = (data: NSData?, urlResponse: NSURLResponse?, error: NSError?)

class CustomURLSession: NSURLSession {
    
    // MARK: Properties
    
    static var mockResponse: MockResponse = (data: nil, urlResponse: nil, error: nil)
    
    // MARK: Override functions
    
    override class func sharedSession() -> NSURLSession {
        return CustomURLSession()
    }
    
    override func dataTaskWithURL(url: NSURL, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) -> NSURLSessionDataTask {
        
        let mockDataTask = MockURLSessionDataTask(response: CustomURLSession.mockResponse, completionHandler: completionHandler)
        return mockDataTask
    }
}

