//
//  CustomURLProtocol.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

open class SessionStubber: URLSession {
    
    // MARK: Properties
    
    fileprivate var mockDataTaskResponse: DataTaskResponse?
    fileprivate var mockUploadTaskResponse: UploadTaskResponse?
    fileprivate var mockDownloadTaskResponse: DownloadTaskResponse?
    
    fileprivate var dataTaskResponse: ((Data?, URLResponse?, NSError?) -> Void)?

    // MARK: Override functions
    
    override open class var shared: SessionStubber {
        return SessionStubber()
    }
}

// MARK: Data Tasks

extension SessionStubber {
    
    override open func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        if let mockDataTaskResponse = mockDataTaskResponse {
            return DataTask(response: mockDataTaskResponse, completionHandler: completionHandler)
        }
        
        super.dataTask(with: request, completionHandler: completionHandler)
    }
    
}

// MARK: Data Task Stubs

extension SessionStubber {
    
    public func stubDataTask(_withData data: Data?, response: URLResponse?, error: NSError?) {
        
        mockDataTaskResponse = (data: data, response: response, error: error)
    }

    public func stubDataTask(_withData data: Data?) {
        
        mockDataTaskResponse = (data: data, response: nil, error: nil)
    }
    
    public func stubDataTask(_withResponse response: URLResponse?) {
        
        mockDataTaskResponse = (data: nil, response: response, error: nil)
    }
    
    public func stubDataTask(_withError error: NSError?) {
        
        mockDataTaskResponse = (data: nil, response: nil, error: error)
    }
}

// MARK: Upload Tasks

extension SessionStubber {
    
    override open func uploadTask(with request: URLRequest, fromFile fileURL: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {
        
        return URLSessionUploadTask()        
    }
    
    override open func uploadTask(with request: URLRequest, from bodyData: Data?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {
        
        return URLSessionUploadTask()
    }
}

// MARK: Download Tasks

extension SessionStubber {

    override open func downloadTask(with request: URLRequest, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask  {
        
        return URLSessionDownloadTask()
    }
    
    override open func downloadTask(with url: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask {
        
        return URLSessionDownloadTask()
    }
    
    override open func downloadTask(withResumeData resumeData: Data, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask {
        
        return URLSessionDownloadTask()
    }
}
