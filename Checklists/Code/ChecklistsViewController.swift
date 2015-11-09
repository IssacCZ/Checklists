//
//  ViewController.swift
//  Checklists
//
//  Created by IssacCZ on 11/4/15.
//  Copyright © 2015 Issac. All rights reserved.
//

import UIKit

class ChecklistsViewController: UITableViewController {
    var items: [ChecklistItem]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "iOS"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "GitHub"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Fitting"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "NBA"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "HIMYM"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1023) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "Add a row"
        item.checked = false
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
}

