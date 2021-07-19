//
//  ArtistTrackTableViewCell.swift
//  iTunesArtistsSearch
//
//

import UIKit

class ArtistTrackTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Configue functioin to bind the UI labels with the data provided to the cell.
    /// Parameter: tractResult of type TrackResult struct.
    func configure(with trackResult: TrackResult) {
        artistNameLabel.text = String("Name: \(trackResult.artistName ?? "")")
        trackNameLabel.text = String("Track: \(trackResult.trackName ?? "")")
        trackPriceLabel.text = String("Price: $\(trackResult.trackPrice ?? 0)")
        primaryGenreNameLabel.text = String("Genre: \(trackResult.primaryGenreName ?? "Not available")")
        releaseDateLabel.text = String("Release Date: \(trackResult.releaseDate ?? "Not available")")
    }
}
