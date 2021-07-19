//
//  showTrackValidTest.swift
//  iTunesArtistsSearchTests
//
//

import XCTest
@testable import iTunesArtistsSearch

class showTrackValidTest: XCTestCase {
    
    func testArtistTrackWithValidJSON() {
       
        guard let json = type(of: self).jsonObject(fromFileName: "track") else { return XCTFail() }
        
        guard let track = try? type(of: self).jsonDecoder.decode(TrackResult.self, from: json) else {
            return XCTFail()
        }
        
        XCTAssertEqual(track.artistName, "Jack Johnson")
        XCTAssertEqual(track.trackName, "Upside Down")
        //XCTAssertEqual(track.releaseDate, "2005-01-01T12:00:00Z")
        //XCTAssertEqual(track.primaryGenreName, "Rock")
        XCTAssertEqual(track.trackPrice, 1.29)
    }

    func testInvalidJSON() {
        guard let json = type(of: self).jsonObject(fromFileName: "invalid") else { return XCTFail() }
        XCTAssertThrowsError(try type(of: self).jsonDecoder.decode(TrackResult.self, from: json))
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension XCTestCase {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }()
    
    static let jsonEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        return jsonEncoder
    }()
    
    static func jsonObject(fromFileName fileName: String) -> Data? {
        let bundle = Bundle(for: self)
        
        guard let jsonURL = bundle.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        
        return try? Data(contentsOf: jsonURL)
    }
}
