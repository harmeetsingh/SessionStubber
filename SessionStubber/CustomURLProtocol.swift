//
//  CustomURLProtocol.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

extension NSObject {
    
    // MARK: Typealias

    typealias DataTaskResponse = (data: NSData?, response: NSURLResponse?, error: NSError?)
    typealias UploadTaskResponse = (data: NSData?, response: NSURLResponse?, error: NSError?)
    typealias DownloadTaskResponse = (url: NSURL?, response: NSURLResponse?, error: NSError?)
}

class CustomURLSession: NSURLSession {
    
    // MARK: Properties
    
    static var dataTaskResponse: DataTaskResponse?
    static var uploadTaskResponse: UploadTaskResponse?
    static var downloadTaskResponse: DownloadTaskResponse?
    
    // MARK: Override functions
    
    override class func sharedSession() -> NSURLSession {
        return CustomURLSession()
    }
}

// MARK: Data Tasks

extension CustomURLSession {
    
    override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {

        return NSURLSessionDataTask()
    }
    
    override func dataTaskWithURL(url: NSURL, completionHandler: (data: NSData?, urlResponse: NSURLResponse?, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        return CustomDataTask(response: CustomURLSession.dataTaskResponse, completionHandler: completionHandler)
    }
}

// MARK: Upload Tasks

extension CustomURLSession {
    
    override func uploadTaskWithRequest(request: NSURLRequest, fromFile fileURL: NSURL, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionUploadTask {
        
        return NSURLSessionUploadTask()        
    }
    
    override func uploadTaskWithRequest(request: NSURLRequest, fromData bodyData: NSData?, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionUploadTask {
        
        return NSURLSessionUploadTask()
    }
}

// MARK: Download Tasks

extension CustomURLSession {

    override func downloadTaskWithRequest(request: NSURLRequest, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask  {
        
        return NSURLSessionDownloadTask()
    }
    
    override func downloadTaskWithURL(url: NSURL, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask {
        
        return NSURLSessionDownloadTask()
    }
    
    override func downloadTaskWithResumeData(resumeData: NSData, completionHandler: (NSURL?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDownloadTask {
        
        return NSURLSessionDownloadTask()
    }
}
