//
//  ItemDetailImageTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class ItemDetailImageTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var itemImageView: CircleImageView!
    @IBOutlet weak private(set) var shopImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        itemImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
        shopImageView.sd_setImageWithURL(NSURL(string: "https://s3-ap-northeast-1.amazonaws.com/makemirror/hungreee/shop2.png"))
    }
    
}
