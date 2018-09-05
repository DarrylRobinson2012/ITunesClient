//
//  AlbumCellViewModel .swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/10/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
import UIKit

struct albumCellViewModel {
    let title : String
    let genre : String
    let releaseDate:  String
    let artwork: UIImage
    }





extension albumCellViewModel{
init(album: Album) {
    self.title = album.censoredName
    self.genre = album.genre.name
    self.artwork = album.artworkState == .downloaded ? album.artwork! : #imageLiteral(resourceName: "AlbumPlaceholder")
    
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.dateFormat = "MMM dd, yyyy"
    
    self.releaseDate = formatter.string(from: album.releaseDate)
}
}
