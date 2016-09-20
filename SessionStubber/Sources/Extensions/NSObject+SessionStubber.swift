//
//  NSObject+SessionStubber.swift
//  SessionStubber
//
//  Created by Harmeet Singh on 19/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

extension NSObject {
    
    // MARK: Typealias
    
    typealias DataTaskResponse = (data: NSData?, response: NSURLResponse?, error: NSError?)
    typealias UploadTaskResponse = (data: NSData?, response: NSURLResponse?, error: NSError?)
    typealias DownloadTaskResponse = (url: NSURL?, response: NSURLResponse?, error: NSError?)
}
