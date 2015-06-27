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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        itemImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
    }
    
}
