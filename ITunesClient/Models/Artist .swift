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
