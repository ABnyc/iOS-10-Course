//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Arpita Bhatia on 1/30/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

//@objc(Item)
public class Item: NSManagedObject {
    
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }

}
