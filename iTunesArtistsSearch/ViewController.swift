//
//  ViewController.swift
//  iTunesArtistsSearch
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var artistsTrackTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    var trackResult = [TrackResult]()
    let artistTrackCellID = "artistTrackCell_XIB"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Register the UItableViewCell with the custom Cell .xib file.
        self.artistsTrackTableView.register(
            UINib.init(nibName: "ArtistTrackTableViewCell", bundle: nil),
            forCellReuseIdentifier: "artistTrackCell_XIB")
        
        artistsTrackTableView.delegate = self
        artistsTrackTableView.dataSource = self
        
        artistsTrackTableView.isHidden = true
        artistsTrackTableView.isHidden = true
    }

    /// Search button will start the actvitiy indicator once it is tapped and will stop animating
    /// once the fetched data is available.
    @IBAction func searchButtonTapped(_ sender: Any) {
        
        beginLoading()
                
        if !(searchBarTextField.text?.isEmpty ?? true) {
            trackResult = NetworkService().FetchTracks(forArtistName: searchBarTextField.text ?? "")
            activityIndicator.startAnimating()
            DispatchQueue.main.async {
                self.artistsTrackTableView.isHidden = false
                self.artistsTrackTableView.reloadData()
            }
        } else {
            let alert = UIAlertController(title: "Error Message", message: "Can't be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        stopLoading()
    }
    
    // Mark:- Begin/Stop activity Indicator
    private func beginLoading() {
        artistsTrackTableView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        artistsTrackTableView.isHidden = false
        activityIndicator.stopAnimating()
    }
}


// UITableView Delegates + DataSource:
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "artistTrackCell_XIB", for: indexPath) as? ArtistTrackTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: trackResult[indexPath.row])
        return cell
    }
    
}
