//
//  ViewController.swift
//  Checklists
//
//  Created by IssacCZ on 11/4/15.
//  Copyright © 2015 Issac. All rights reserved.
//

import UIKit

class ChecklistsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let label = cell.viewWithTag(1023) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "NBA"
        } else if indexPath.row % 5 == 1 {
            label.text = "iOS"
        } else if indexPath.row % 5 == 2 {
            label.text = "WWDC"
        } else if indexPath.row % 5 == 3 {
            label.text = "Fitting"
        } else if indexPath.row % 5 == 4 {
            label.text = "GitHub"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .None {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

