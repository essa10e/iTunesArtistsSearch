//
//  ArtistModelTests.swift
//  iTunesArtistsSearchTests
//
//  Created by Essa Aldo on 7/19/21.
//

import XCTest
@testable import iTunesArtistsSearch

class ArtistModelStructTests: XCTestCase {
    
    // Mark:- Initialization Tests
    func testInit_TrackWithArtistName() {
        let testTrack = TrackResult(artistName: "Drake", trackName: "Drake Album", releaseDate: "12-01-2020", primaryGenreName: "POP", trackPrice: 12.5)
        
        XCTAssertNotNil(testTrack)
        XCTAssertEqual(testTrack.artistName, "Drake")
        XCTAssertEqual(testTrack.trackName, "Drake Album")
        XCTAssertEqual(testTrack.releaseDate, "12-01-2020")
        XCTAssertEqual(testTrack.primaryGenreName, "POP")
        XCTAssertEqual(testTrack.trackPrice, 12.5)
    }
}
