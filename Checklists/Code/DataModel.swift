//
//  DataModel.swift
//  Checklists
//
//  Created by IssacCZ on 11/11/15.
//  Copyright © 2015 Issac. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists") as! [Checklist]
                unarchiver.finishDecoding()
            }
        }
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
}