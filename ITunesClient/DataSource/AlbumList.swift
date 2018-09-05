//
//  AlbumList.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/10/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumList: NSObject, UITableViewDataSource {
    
    private var albums : [Album]
    let tableview:  UITableView
    let pendingOperations = PendingOperations()
    
    init(albums: [Album], tableview: UITableView) {
        self.albums = albums
        self.tableview = tableview
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
            AlbumCell.reuseID, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = albumCellViewModel(album: album )
       
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder{
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
                
            
            
        }
        
        return albumCell
    }
    //Mark: Helper
    func album(at indexpath: IndexPath) -> Album {
        return albums[indexpath.row]
    }
    func update(with albums: [Album]){
        self.albums = albums
        
    }
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableview.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
        
        
    }

}

