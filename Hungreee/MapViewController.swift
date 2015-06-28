//
//  MapViewController.swift
//  Hungreee
//
//  Created by 本間皇成 on 2015/06/28.
//  Copyright (c) 2015年 Hungreee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        mapView = MKMapView()
    }
    
    
    func setCenterOfMapToLocation(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func addPinToMapView() {
        let location = CLLocationCoordinate2D(latitude: 35.66687568, longitude: 139.74947495)
        let annotation = MapLocation(coordinate: location, title: "", subtitle: "")
        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(location)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addPinToMapView()
    }
}