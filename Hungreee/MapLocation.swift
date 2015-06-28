//
//  MapLocation.swift
//  Hungreee
//
//  Created by 本間皇成 on 2015/06/28.
//  Copyright (c) 2015年 Hungreee. All rights reserved.
//

import UIKit
import MapKit

class MapLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String!
    var subtitle: String!
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
}