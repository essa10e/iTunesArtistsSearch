//
//  NetworkService.swift
//  iTunesArtistsSearch
//
//

import UIKit

class NetworkService: NSObject {
    private let endpoint = "https://itunes.apple.com/search?term="
    
    /// this fetch tracks from the iTunes api
    func FetchTracks(forArtistName: String) -> [TrackResult] {
        var tracks = [TrackResult]()
         let searchString = forArtistName.replacingOccurrences(of: " ", with: "+")
        if let url = URL(string: endpoint + searchString) {
             if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                    if let lisTracks = try? decoder.decode(ItunesResult.self, from: data) {
                        tracks = lisTracks.results
                    }
             }
         }
     
        return tracks
    }
}
