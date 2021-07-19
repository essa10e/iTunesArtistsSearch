//
//  ArtistTrackViewControllerTest.swift
//  iTunesArtistsSearchTests
//
//  Created by Essa Aldo on 7/19/21.
//

import XCTest
@testable import iTunesArtistsSearch

class ArtistTrackViewControllerTest: XCTestCase {

    var sut: ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewController()
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK:- TableView Test - Checks Nil
    func testGroceryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.artistsTrackTableView)
    }

    // MARK:- DataSource Test
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.artistsTrackTableView.dataSource)
        //XCTAssertTrue(sut.artistsTrackTableView.dataSource is GroceryCartDataService)
    }
    
    // MARK:- Delegate Test
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.artistsTrackTableView.delegate)
        //XCTAssertTrue(sut.groceryTableView.delegate is GroceryCartDataService)
    }
}
