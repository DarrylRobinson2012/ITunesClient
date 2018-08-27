//
//  AlbumDetailViewModel.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/12/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
struct AlbumDetailViewModel {
    let title : String
    let genre : String
    let releaseDate:  String
    
    
}


extension AlbumDetailViewModel{
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.genre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
