//
//  ArtistModel.swift
//  iTunesArtistsSearch
//
//

import Foundation

struct ItunesResult: Codable {
    //let resultCount: Int
    let results: [TrackResult]
}

struct TrackResult: Codable {
    let artistName: String?
    let trackName: String?
    let releaseDate: String?
    let primaryGenreName: String?
    let trackPrice: Double?
}
