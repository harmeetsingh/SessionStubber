//
//  CustomURLProtocol.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

public class SessionStubber: NSURLSession {
    
    // MARK: Properties
    
    private var mockDataTaskResponse: DataTaskResponse?
    private var mockUploadTaskResponse: UploadTaskResponse?
    private var mockDownloadTaskResponse: DownloadTaskResponse?

    // MARK: Override functions
    
    override public class func sharedSession() -> SessionStubber {
        
        return SessionStubber()
    }
}

// MARK: Data Tasks

extension SessionStubber {
    
    override public func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {

        return NSURLSessionDataTask()
    }
    
    override public func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        
        return CustomDataTask(response: mockDataTaskResponse, completionHandler: completionHandler)
    }
}

// MARK: Data Task Stubs

extension SessionStubber {
    
    public func stubDataTask(_withData data: NSData?, response: NSURLResponse?, error: NSError?) {
        
        mockDataTaskResponse = (data: data, response: response, error: error)
    }

    public func stubDataTask(_withData data: NSData?) {
        
        mockDataTaskResponse = (data: data, response: nil, error: nil)
    }
    
    public func stubDataTask(_withResponse response: NSURLResponse?) {
        
        mockDataTaskResponse = (data: nil, response: response, error: nil)
    }
    
    public func stubDataTask(_withError error: NSError?) {
        
        mockDataTaskResponse = (data: nil, response: nil, error: error)
    }
}

// MARK: Upload Tasks

extension SessionStubber {
    
    override public func uploadTaskWithRequest(request: NSURLRequest, fromFile fileURL: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionUploadTask {
        
        return NSURLSessionUploadTask()        
    }
    
    override public func uploadTaskWithRequest(request: NSURLRequest, fromData bodyData: NSData?, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionUploadTask {
        
        return NSURLSessionUploadTask()
    }
}

// MARK: Download Tasks

extension SessionStubber {

    override public func downloadTaskWithRequest(request: NSURLRequest, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask  {
        
        return NSURLSessionDownloadTask()
    }
    
    override public func downloadTaskWithURL(url: NSURL, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask {
        
        return NSURLSessionDownloadTask()
    }
    
    override public func downloadTaskWithResumeData(resumeData: NSData, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask {
        
        return NSURLSessionDownloadTask()
    }
}
