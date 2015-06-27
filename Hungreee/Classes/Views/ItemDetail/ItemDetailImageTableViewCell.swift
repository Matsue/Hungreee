//
//  ItemDetailImageTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class ItemDetailImageTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var itemImageView: UIImageView!
    @IBOutlet weak private(set) var shopImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shopImageView.layer.borderWidth = 3.0
        shopImageView.layer.borderColor = UIColor.whiteColor().CGColor
        shopImageView.layer.cornerRadius = shopImageView.frame.size.width / 2
        shopImageView.clipsToBounds = true
        self.bringSubviewToFront(shopImageView)
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        itemImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
        shopImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
    }
    
}
