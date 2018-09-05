//
//  SearchResultsControllerTableViewController.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/9/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class SearchResultController: UITableViewController {

        let searchController = UISearchController(searchResultsController: nil)
        let dataSource = SearchResultsDataSource()
        let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set table view to the Searchbar
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        tableView.dataSource = dataSource
        
        definesPresentationContext = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Set the right bar button to add button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SearchResultController.dismiss))
    }


    func dismissSearchController (){
        self.dismiss(animated: true, completion: nil)
        
}
    //MARK: NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                let albumListController = segue.destination as! AlbumListController
                albumListController.artist = artist
                client.lookupArtist(withID: artist.id){ artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
                
            }
        }
    
    }
}
    extension SearchResultController: UISearchResultsUpdating {
    
        
        func updateSearchResults(for searchController: UISearchController) {
            client.searchForArtist(withTerm: searchController.searchBar.text!) {[weak self] artist, error in
                self?.dataSource.update(with: artist)
                self?.tableView.reloadData()
            }
        }
    }


//helper: 



