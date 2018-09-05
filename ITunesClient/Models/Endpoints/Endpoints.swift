//
//  Endpoints.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/27/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

protocol Enpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    
    
}
enum Itunes{
    case search(term: String, media: ItunesMedia?)
    case lookup(id: Int, entity: ItunesEntity?)
    
}

extension Enpoint{
    var urlComponents: URLComponents{
    var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
    return components
}
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}


extension Itunes: Enpoint {
    var base: String {
        return "https://itunes.apple.com"
    }
    var path: String {
        switch self {
        case .search:
            return "/search"
        case .lookup:
            return "/lookup"
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term, let media):
            var result = [ URLQueryItem]()
            
            let searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media{
                let mediaItem = URLQueryItem(name: "media", value: media.description)
                result.append(mediaItem)
            
                if let enityQueryItem = media.entityQueryItem {
                    result.append(enityQueryItem)
                }
                
                if let attributeQueryItem = media.attributeQueryItem {
                    result.append(attributeQueryItem)
                }
            
            
            }
            return result
            case .lookup(let id, let entity):
            return [
                URLQueryItem(name: "id", value: id.description),
                URLQueryItem(name: "entity", value: entity?.entityName)
            ]
            
            }
        }
    }
