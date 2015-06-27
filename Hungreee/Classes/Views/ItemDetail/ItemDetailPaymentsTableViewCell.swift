//
//  ItemDetailPaymentsTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/28/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class ItemDetailPaymentsTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var cashPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var workPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var snsPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var applyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyButton.layer.cornerRadius = 4.0
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
    
    @IBAction func apply(sender: UIButton) {
    }
}
