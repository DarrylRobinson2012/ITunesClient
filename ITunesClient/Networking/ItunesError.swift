//
//  ItunesError.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/28/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)

    
}
