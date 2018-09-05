//
//  AlbumDetailDataSource.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/12/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    private var songs: [Song]
    init(song: [Song]) {
        self.songs = song
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongCell
        let song = songs[indexPath.row]
        let viewModel = SongViewModel(song: song)
        cell.songTitle.text = viewModel.title
        cell.runTime.text = viewModel.runTime
        return cell
    }
    

    //MARK: Tableview
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            
        case 0:
            return "Tracks"
        default:
            return nil
        }
    }

func update(with songs: [Song]) {
    self.songs = songs
}
}
