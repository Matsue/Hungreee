//
//  ItemDetailViewController.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let _item = item {
            title = _item.title as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureWithItem(item: Item) {
        self.item = item;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
