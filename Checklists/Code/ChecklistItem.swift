//
//  ChecklistItem.swift
//  Checklists
//
//  Created by IssacCZ on 11/8/15.
//  Copyright © 2015 Issac. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}