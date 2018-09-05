//
//  AlbumDetailController.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/12/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {

    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumGenre: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var dataSource = AlbumDetailDataSource(song: [])
    var album: Album? {
        didSet {
            if let album = album{
                configure(with: album)
                dataSource.update(with: album.song)
                tableView.reloadData()
            }
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let album = album {
            configure(with: album)
            }
        tableView.dataSource = dataSource
    

}
    
    
    
    
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        // add implentation
        
        albumTitle.text = viewModel.title
        albumGenre.text = viewModel.genre
        releaseDate.text = viewModel.releaseDate
        
        
        
    }
    
    
   
}
