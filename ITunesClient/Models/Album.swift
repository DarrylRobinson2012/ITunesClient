//
//  Album.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/1/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
class Album {
    let id: Int
    let artistName: String
    let name:  String
    let censoredName: String
    let genre: Genre
    let artWorkUrl: String
    let isExplicit: Bool
    let numberOfTracks: Int
    let releaseDate: Date
    var song = [Song]()
    
    
    init(id: Int, artistName: String, name: String, censoredName: String, genre: Genre, artWorkUrl: String, isExplicit: Bool, numberOfTracks: Int, releaseDate: Date){
        self.id = id
        self.artistName = artistName
        self.name = name
        self.censoredName = censoredName
        self.genre = genre
        self.artWorkUrl = artWorkUrl
        self.isExplicit = isExplicit
        self.numberOfTracks = numberOfTracks
        self.releaseDate = releaseDate
        
    
}
}
