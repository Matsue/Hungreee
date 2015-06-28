//
//  ItemDetailDescriptionTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import DJWStarRatingView

class ItemDetailDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var titleLabel: UILabel!
    @IBOutlet weak private(set) var subtitleLabel: UILabel!
    @IBOutlet weak private(set) var reviewScoreLabel: UILabel!
    @IBOutlet weak private(set) var starRatingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        titleLabel.text = item.title
        subtitleLabel.text = item.title
        let reviewScoreString = String(item.reviewScore)
        reviewScoreLabel.text = "\(reviewScoreString).0"
        let starView = DJWStarRatingView(
            starSize: CGSize(width: 20, height: 20),
            numberOfStars: 5,
            rating: Float(item.reviewScore),
            fillColor: UIColor.orangeColor(),
            unfilledColor: UIColor.grayColor(),
            strokeColor: UIColor.whiteColor()
        )
        starRatingView.addSubview(starView)
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        titleLabel.preferredMaxLayoutWidth = screenWidth
        subtitleLabel.preferredMaxLayoutWidth = screenWidth
        reviewScoreLabel.preferredMaxLayoutWidth = screenWidth
    }
    
}
