//
//  ItemDescriptionTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import DJWStarRatingView

class ItemDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var titleLabel: UILabel!
    @IBOutlet weak private(set) var subtitleLabel: UILabel!
    @IBOutlet weak private(set) var starRatingView: UIView!
    @IBOutlet weak private(set) var reviewScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        titleLabel.text = item.title
        subtitleLabel.text = item.title
        let starView = DJWStarRatingView(
            starSize: CGSize(width: 20, height: 20),
            numberOfStars: 5,
            rating: Float(item.reviewScore),
            fillColor: UIColor.yellowColor(),
            unfilledColor: UIColor.grayColor(),
            strokeColor: UIColor.whiteColor()
        )
        starRatingView.addSubview(starView)
        let reviewScoreString = String(item.reviewScore)
        reviewScoreLabel.text = "\(reviewScoreString).0"
    }
    
}
