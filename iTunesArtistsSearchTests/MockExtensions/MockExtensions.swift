//
//  MockExtensions.swift
//  iTunesArtistsSearchTests
//
//  Created by Essa Aldo on 7/19/21.
//


import XCTest
@testable import iTunesArtistsSearch

extension ArtistTrackViewControllerTest {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        class func initMock(dataSource: ViewController) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 250, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(GroceryCellMock.self, forCellReuseIdentifier: "artistTrackCell")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class GroceryCellMock: ArtistsTrackTableViewCell {
        var trackReult: TrackResult?
        
        override func configure(with track: TrackResult) {
            trackReult = track
        }
    }
}
