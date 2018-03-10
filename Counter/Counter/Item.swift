//
//  Item.swift
//  Counter
//
//  Created by serfusE on 17/07/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit
import os.log

class Item: NSObject, NSCoding {
    
    var name: String
    
    struct PropertyKey {
        static let name = "name"
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("itemsNames")
    
    init?(name: String) {
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(name: name)
    }
    
}
