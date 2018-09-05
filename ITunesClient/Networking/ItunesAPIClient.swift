//
//  ItunesAPIClient.swift
//  ITunesClient
//
//  Created by Darryl Robinson  on 8/28/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtist(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void ) {
            let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        performRequest(with: endpoint) { results, error in
            guard let results = results
                else {
                    completion( [], error)
                    return
            }
            let artist = results.flatMap{ Artist(json: $0) }
            completion(artist, nil)
        }
        
}
    
    func lookupArtist(withID id: Int,  completion: @escaping (Artist?, ItunesError?) -> Void) {
        
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.album)
        performRequest(with: endpoint) { results, error in
            guard let results = results  else {
                completion(nil, error)
                return
            }
            guard let artistInfo = results.first
                else {
                    completion(nil, .jsonParsingFailure(message: "Could not parse artist Information"))
                    return
                }
            guard let artist = Artist(json: artistInfo) else {
                completion(nil, .jsonParsingFailure(message: "Could not parse artist information"))
                return
            }
            let albumResults = results[1..<results.count]
            let albums = albumResults.flatMap{ Album(json: $0) }
            
            artist.albums = albums
            completion(artist, nil)
            
        }
    }
    
    func lookUpAlbum(withId id: Int, completion: @escaping (Album?, ItunesError?) -> Void) {
            let endpoint = Itunes.lookup(id: id, entity: MusicEntity.song
        )
        performRequest(with: endpoint) { results ,error in
            guard let results = results else {
                completion(nil, error)
                return
            }
            guard let albumInfo = results.first else {
                completion(nil, .jsonParsingFailure(message: "Could not parse AlbumInformation"))
                return
            }
            guard let album = Album(json: albumInfo) else {
                completion(nil, .jsonParsingFailure(message: "Cpuld not parse album information"))
                return
            }
            
            let songResults = results[1..<results.count]
            let songs = songResults.flatMap{ Song(json: $0)}
            album.song = songs
            completion(album, nil)
        }
        
    }
    
    
    
    
    typealias Results = [[String: Any]]
    private func performRequest(with endpoint: Enpoint, completion: @escaping (Results?, ItunesError?) -> Void) {
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let results = json["results"] as? [[String : Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON does not contain results"))
                    return
                }
                completion(results, nil)
            }
        }
        task.resume()
        
    }

}
