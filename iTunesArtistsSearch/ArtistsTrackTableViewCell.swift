//
//  ArtistsTrackTableViewCell.swift
//  iTunesArtistsSearch
//
//

import UIKit

class ArtistsTrackTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with trackResult: TrackResult) {
        artistNameLabel.text = trackResult.artistName
        trackNameLabel.text = trackResult.trackName
        trackPriceLabel.text = String("$\(trackResult.trackPrice ?? 0)")
        primaryGenreNameLabel.text = trackResult.primaryGenreName
        releaseDateLabel.text = trackResult.releaseDate
    }

}
