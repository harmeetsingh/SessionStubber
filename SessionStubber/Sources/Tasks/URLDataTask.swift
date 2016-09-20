//
//  CustomDataTask.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

class CustomDataTask: NSURLSessionDataTask {
    
    // MARK: Properties
    
    var customResponse: DataTaskResponse?
    let completionHandler: ((NSData?, NSURLResponse?, NSError?) -> Void)?
    
    // MARK: Lifeycle
    
    init(response: DataTaskResponse?, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) {
        
        self.customResponse = response
        self.completionHandler = completionHandler
    }
}

// MARK: Override function

extension CustomDataTask {
    
    override func resume() {
        
        guard let completion = completionHandler, customResponse = customResponse else {
            return
        }
        
        completion(customResponse.data, customResponse.response, customResponse.error)
    }
}