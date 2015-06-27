//
//  Item.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class Item: NSObject, Printable {
    
    let id: String
    let title: String
    let imageUrl: String
    let paybackTypes: [String]
    let reviewScore: Int
    let lat: String
    let lng: String

    init(id: String, title: String, imageUrl: String?, paybackTypes: [String]?, reviewScore: String?, lat: String, lng: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl ?? ""
        self.paybackTypes = paybackTypes ?? []
        self.reviewScore = reviewScore?.toInt() ?? 0
        self.lat = lat
        self.lng = lng
    }
    
}
