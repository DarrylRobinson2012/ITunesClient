//
//  ViewController.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/1/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
      let searchEndpoint = Itunes.search(term: "Taylor Swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        print(searchEndpoint.request)
        print("*********")
        let lookupEndpoint = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
        print(lookupEndpoint.request)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

