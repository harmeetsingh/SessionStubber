//
//  URLDataTask.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

class URLDataTask: URLSessionDataTask {
    
    // MARK: Properties
    
    fileprivate var customResponse: DataTaskResponse?
    fileprivate let completionHandler: ((Data?, URLResponse?, NSError?) -> Void)?
    
    // MARK: Lifeycle
    
    init(response: DataTaskResponse?, completionHandler: @escaping (Data?, URLResponse?, NSError?) -> Void) {
        
        self.customResponse = response
        self.completionHandler = completionHandler
    }
}

// MARK: Override function

extension URLDataTask {
    
    override func resume() {
        
        guard let completion = completionHandler, let customResponse = customResponse else {
            return
        }
        
        completion(customResponse.data, customResponse.response, customResponse.error)
    }
}
