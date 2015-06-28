//
//  WaitingViewController.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/28/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    @IBAction func openMap(sender: UIButton) {
        let mapViewCnt:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapView") as! UIViewController
        navigationController?.pushViewController(mapViewCnt, animated: true)
    }
}
