//
//  ItemDetailTableViewController.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import SDWebImage

class ItemDetailTableViewController: UITableViewController {
    
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
        
        if let _item = item {
            title = _item.title as String
        }
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
