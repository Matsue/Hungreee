//
//  WelcomeViewController.swift
//  Hungreee
//
//  Created by 本間皇成 on 2015/06/28.
//  Copyright (c) 2015年 Hungreee. All rights reserved.
//

import UIKit
import EAIntroView

class WelcomeViewController: UIViewController, EAIntroDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgColor = UIColor(red: 241, green: 234, blue: 13, alpha: 0)
        
        let page1: EAIntroPage = EAIntroPage()
        let imageView1 =  UIImageView(image: UIImage(named: "Sub1"))
        let childW = CGRectGetWidth(imageView1.bounds) / 42 * 31
        let childH = CGRectGetHeight(imageView1.bounds) / 28 * 21
        let imageRect = CGRectMake(0, 0, childW, childH)
        imageView1.bounds = imageRect
        page1.titleIconPositionY = 0
        page1.titleIconView = imageView1
        
        let page2 = EAIntroPage()
        let imageView2 =  UIImageView(image: UIImage(named: "Sub2"))
        imageView2.bounds = CGRectMake(0, 0, childW, childH)
        page2.titleIconPositionY = 0
        page2.titleIconView = imageView2
        
        let page3 = EAIntroPage()
        let imageView3 =  UIImageView(image: UIImage(named: "Sub3"))
        imageView3.bounds = CGRectMake(0, 0, childW, childH)
        page3.titleIconView = imageView3
        page3.titleIconPositionY = 0

        let introView: EAIntroView = EAIntroView(frame: self.view.bounds, andPages: [page1, page2, page3])
        introView.delegate = self

        introView.showInView(self.view, animateDuration: 0.0)
        introView.skipButton.hidden = true
        introView.pageControl.hidden = true
        
        
    }

    func introDidFinish(introView: EAIntroView!) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    func intro(introView: EAIntroView!, pageAppeared page: EAIntroPage!, withIndex pageIndex: UInt) {
        
    }
    func intro(introView: EAIntroView!, pageStartScrolling page: EAIntroPage!, withIndex pageIndex: UInt) {
        
    }
    func intro(introView: EAIntroView!, pageEndScrolling page: EAIntroPage!, withIndex pageIndex: UInt) {
        
    }

    
}