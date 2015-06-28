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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
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
        var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update() {
        let mapViewCnt:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("reviewViewControllerID") as! UIViewController
        navigationController?.pushViewController(mapViewCnt, animated: true)
    }
}