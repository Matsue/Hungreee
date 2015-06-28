//
//  ItemDetailPaymentsTableViewCell.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/28/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

protocol ItemDetailPaymentsTableViewCellDelegate {
    func itemDetailPaymentsTableViewCellDelegate(itemDetailPaymentsTableViewCell: ItemDetailPaymentsTableViewCell, didClickApplyButton: UIButton)
}

class ItemDetailPaymentsTableViewCell: UITableViewCell {

    var delegate: ItemDetailPaymentsTableViewCellDelegate!
    
    @IBOutlet weak private(set) var cashPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var workPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var snsPaymentImageView: CircleImageView!
    @IBOutlet weak private(set) var applyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Round button
        applyButton.layer.cornerRadius = 4.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        // TODO: Manage icons with item object
    }
    
    // MARK: IBActions
    
    @IBAction func cashPaymentImageTouched(sender: UIButton) {
        cashPaymentImageView.highlighted = true
        workPaymentImageView.highlighted = false
        snsPaymentImageView.highlighted = false
    }
    
    @IBAction func workPaymentImageTouched(sender: UIButton) {
        // Do nothing now
    }
    
    @IBAction func snsPaymentImageTouched(sender: UIButton) {
        cashPaymentImageView.highlighted = false
        workPaymentImageView.highlighted = false
        snsPaymentImageView.highlighted = true
    }
    
    @IBAction func apply(sender: UIButton) {
        delegate?.itemDetailPaymentsTableViewCellDelegate(self, didClickApplyButton: sender)
    }
    
}
