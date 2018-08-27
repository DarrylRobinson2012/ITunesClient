//
//  SongViewModel.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/12/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runTime: String
    
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
    
        //track time in milliseconds
        
        let timeInSeconds = song.time/100
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.runTime = "\(minutes):\(seconds)"
    }
}
