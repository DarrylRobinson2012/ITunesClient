//
//  AlbumCell.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/10/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    

    static let reuseID = "AlbumCell"
    
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure( with viewModel: albumCellViewModel) {
        albumTitle.text = viewModel.title
        genre.text = viewModel.genre
        releaseDate.text = viewModel.releaseDate
        artwork.image = viewModel.artwork
    }
    
    
    
}
