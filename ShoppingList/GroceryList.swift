//
//  GroceryList.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class GroceryList: NSManagedObject {

    // Insert code here to add functionality to your managed object subclass
    convenience init(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {

        let entity = NSEntityDescription.entityForName("GroceryList", inManagedObjectContext: context)!

        self.init(entity: entity, insertIntoManagedObjectContext: context)

        self.name = name
        self.isComplete = false
    }
}

//func ==(lhs: GroceryList, rhs: GroceryList) {
//    return lhs.isComplete == rhs.isComplete && lhs.name == rhs.name
//}