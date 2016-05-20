//
//  GroceryListController.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class GroceryListController {
    
    static let sharedInstance = GroceryListController()
    
    var groceryLists = [GroceryList]()
    
    init() {
    }
    
        func addItem(title: String) {
            let groceryList = GroceryList(checked: true, title: title)
            groceryLists.append(groceryList)
    }
        
        func removeItem(groceryItem: GroceryList) {
            guard let indexOfGroceryList = groceryLists.indexOf(groceryItem) else {
                return
            }
            groceryLists.removeAtIndex(indexOfGroceryList)
    }
    
//    static func createItem(title: String) {
//        let item = GroceryList(checked: true, title: title)
//        GroceryListController.sharedInstance.addItem(item)
//    }
//    
    
}