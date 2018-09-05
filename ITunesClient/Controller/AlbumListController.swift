//
//  AlbumListController.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/10/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    private struct constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    
    lazy var dataSource: AlbumList  = {
        return AlbumList(albums: [], tableview: self.tableView)
    }()
    
    var client = ItunesAPIClient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
       
        
        

    }

    //MARK: TABLEVIEWDELEGATE
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return constants.AlbumCellHeight
    }
    
    //MARK: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                
                
                
                let albumDetailController = segue.destination as! AlbumDetailController
                
                client.lookUpAlbum(withId: selectedAlbum.id) { album, error in
                    albumDetailController.album = album
                    
                }
                
                
            }
        }
    }
    
    






}
