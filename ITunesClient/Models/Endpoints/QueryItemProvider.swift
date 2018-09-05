//
//  QueryItemProvider.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/27/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
