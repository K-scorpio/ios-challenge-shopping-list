//
//  GroceryList+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GroceryList {

    @NSManaged var isComplete: NSNumber?
    @NSManaged var name: String

}
