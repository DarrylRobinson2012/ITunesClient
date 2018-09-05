//
//  PendingOperations.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 9/1/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

class PendingOperations: Operation {
    var downloadsInProgress = [IndexPath: Operation]()
   
    let downloadQueue = OperationQueue()
 
    
    
}
