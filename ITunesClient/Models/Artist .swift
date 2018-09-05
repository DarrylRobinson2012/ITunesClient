//
//  Artist .swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/1/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
class Artist {
    let id: Int
    let name: String
    let genre: Genre
    var albums: [Album]
    
    
    init(id:Int, name: String, genre: Genre, albums: [Album]){
            self.id = id
            self.name = name
            self.genre = genre
            self.albums = albums
    }
}
extension Artist {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let artistName = "artistName"
            static let artistId = "artistId"
            static let primaryGenreId = "primaryGenreId"
        }
        
        guard let artistName = json[Key.artistName] as? String,
            let artistId = json[Key.artistId] as? Int,
            let primaryGenreId = json[Key.primaryGenreId] as? Int,
            let primaryGenreValue = Genre(rawValue: primaryGenreId) else {
                return nil
        }
        
        self.init(id: artistId, name: artistName, genre: primaryGenreValue, albums: [])
    }
}
