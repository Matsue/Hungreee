//
//  CircleImageView.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/28/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func awakeFromNib() {
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
