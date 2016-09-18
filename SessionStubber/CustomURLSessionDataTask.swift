//
//  CustomURLSessionDataTask.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

class MockURLSessionDataTask: NSURLSessionDataTask {
    
    // MARK: Properties
    
    var mockResponse: MockResponse
    let completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?
    
    // MARK: Lifeycle
    
    init(response: MockResponse, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) {
        
        self.mockResponse = response
        self.completionHandler = completionHandler
    }
    
    // MARK: Override function
    
    override func resume() {
        
        guard let completion = completionHandler else {
            return
        }
        
        completion(mockResponse.data, mockResponse.urlResponse, mockResponse.error)
    }
}