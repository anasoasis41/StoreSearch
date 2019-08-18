//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Anas Riahi on 8/7/19.
//  Copyright © 2019 Anas Riahi. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var artworkImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var downloadTask: URLSessionDownloadTask?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK:- Public Methods
    func configure(for result: SearchResult) {
        nameLabel.text = result.name
        
        if result.artist.isEmpty {
            artistNameLabel.text = "UNKNOWN"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)", result.artist, result.type)
        }
        
        // load images
        artworkImageview.image =  UIImage(named: "Placeholder")
        if let smallURL = URL(string: result.imageSmall) {
            downloadTask = artworkImageview.loadImage(url: smallURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }

}
