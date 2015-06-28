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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openMap(sender: UIButton) {
        let mapViewCnt:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapView") as! UIViewController
        navigationController?.pushViewController(mapViewCnt, animated: true)
    }
}
