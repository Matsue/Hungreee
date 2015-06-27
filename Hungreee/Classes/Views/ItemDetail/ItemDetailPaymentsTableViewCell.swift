//
//  ItemDetailPaymentsTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/28/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class ItemDetailPaymentsTableViewCell: UITableViewCell {

    @IBOutlet weak var cashPaymentImageView: CircleImageView!
    @IBOutlet weak var workPaymentImageView: CircleImageView!
    @IBOutlet weak var snsPaymentImageView: CircleImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        cashPaymentImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
        workPaymentImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
        snsPaymentImageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
    }
    
}
