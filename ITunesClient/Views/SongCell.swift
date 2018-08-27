//
//  SongCell.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/12/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    static let reuseId = "songCell"
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var runTime: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
