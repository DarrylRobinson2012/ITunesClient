//
//  AlbumList.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/10/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumList: NSObject, UITableViewDataSource {
    
    private let albums : [Album]
    
    init(albums: [Album]) {
        self.albums = albums
        super.init()
    }

    //Mark: DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier:
            "AlbumCell", for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = albumCellViewModel(album: album )
       
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        return albumCell
    }
    //Mark: Helper
    func album(at indexpath: IndexPath) -> Album {
        return albums[indexpath.row]
    }

}

