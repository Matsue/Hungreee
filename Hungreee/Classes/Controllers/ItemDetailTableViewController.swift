//
//  ItemDetailTableViewController.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import SDWebImage

class ItemDetailTableViewController: UITableViewController, ItemDetailPaymentsTableViewCellDelegate {
    
    private var item: Item!
    private var itemDescriptionTableViewCell: ItemDetailDescriptionTableViewCell!
    private var itemDetailPaymentsTableViewCell: ItemDetailPaymentsTableViewCell!
    
    enum ItemDetailTableViewRows {
        case ItemImageRow
        case ItemDescriptionRow
        case ItemPaymentsRow
        case ItemDetailTableViewRowsCount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Construction
    
    func constructWithItem(item: Item) {
        self.item = item;
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemDetailTableViewRows.ItemDetailTableViewRowsCount.hashValue
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell!
        
        switch indexPath.row {
        case ItemDetailTableViewRows.ItemImageRow.hashValue:
            let itemDetailImageTableViewCell = tableView.dequeueReusableCellWithIdentifier("ItemDetailImageTableViewCellID", forIndexPath: indexPath) as? ItemDetailImageTableViewCell
            itemDetailImageTableViewCell?.constructWithItem(item)
            cell = itemDetailImageTableViewCell
            
        case ItemDetailTableViewRows.ItemDescriptionRow.hashValue:
            cell = createItemDescriptionTableViewCellIfNeeded(item)
            
        case ItemDetailTableViewRows.ItemPaymentsRow.hashValue:
            cell = createItemDetailPaymentsTableViewCellIfNeeded(item)
            
        default:
            cell = UITableViewCell()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat
        
        switch indexPath.row {
        case ItemDetailTableViewRows.ItemImageRow.hashValue:
            height = view.frame.width / 2
            
        case ItemDetailTableViewRows.ItemDescriptionRow.hashValue:
            // TODO: Calculate height dynamically
//            height = createItemDescriptionTableViewCellIfNeeded(item).frame.height
            height = 116
            
        case ItemDetailTableViewRows.ItemPaymentsRow.hashValue:
            // TODO: Calculate height dynamically
//            height = createItemDetailPaymentsTableViewCellIfNeeded(item).frame.height
            height = 104
            
        default:
            height = CGFloat.min
        }
        
        return height
    }
    
    // MARK: ItemDetailPaymentsTableViewCellDelegate
    
    func itemDetailPaymentsTableViewCellDelegate(itemDetailPaymentsTableViewCell: ItemDetailPaymentsTableViewCell, didClickApplyButton: UIButton) {
        let waitingViewController = storyboard?.instantiateViewControllerWithIdentifier("WaitingViewControllerID") as! WaitingViewController
        navigationController?.pushViewController(waitingViewController, animated: true)
    }
    
    // MARK: Private
    
    private func createItemDescriptionTableViewCellIfNeeded(item: Item) -> ItemDetailDescriptionTableViewCell {
        if itemDescriptionTableViewCell == nil {
            itemDescriptionTableViewCell = tableView.dequeueReusableCellWithIdentifier("ItemDetailDescriptionTableViewCellID") as? ItemDetailDescriptionTableViewCell
            itemDescriptionTableViewCell?.constructWithItem(item)
        }
        
        return itemDescriptionTableViewCell;
    }
    
    private func createItemDetailPaymentsTableViewCellIfNeeded(item: Item) -> ItemDetailPaymentsTableViewCell {
        if itemDetailPaymentsTableViewCell == nil {
            itemDetailPaymentsTableViewCell = tableView.dequeueReusableCellWithIdentifier("ItemDetailPaymentsTableViewCellID") as? ItemDetailPaymentsTableViewCell
            itemDetailPaymentsTableViewCell?.constructWithItem(item)
        }
        
        return itemDetailPaymentsTableViewCell;
    }
    
}
