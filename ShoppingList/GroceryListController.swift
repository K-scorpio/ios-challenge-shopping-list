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
    
    var groceryLists: [GroceryList] {
        let request = NSFetchRequest(entityName: "GroceryList")
        let moc = Stack.sharedStack.managedObjectContext
        do {
            return try moc.executeFetchRequest(request) as! [GroceryList]
        } catch {
            return []
        }
    }
    
    init() {
        let request = NSFetchRequest(entityName: "GroceryList")
        _ = NSSortDescriptor(key: "isComplete", ascending: true)
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Unable to perform fetch request: \(error.localizedDescription)")
        }
    }
    
    func addItem(title: String) {
//            let groceryList = GroceryList(name: title)
//            groceryLists.append(groceryList)
        saveToPersistentStorage()
    }
        
        func removeItem(groceryItem: GroceryList) {
            groceryItem.managedObjectContext?.deleteObject(groceryItem)
            saveToPersistentStorage()
    }
    
    func isCompleteValueToggle(groceryItem: GroceryList) {
        groceryItem.isComplete = groceryItem.isComplete!.boolValue
        
        saveToPersistentStorage()
    }
    
    let fetchedResultsController: NSFetchedResultsController
    
//    static func createItem(title: String) {
//        let item = GroceryList(checked: true, title: title)
//        GroceryListController.sharedInstance.addItem(item)
//    }
    
    // MARK: - Persistence
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
}



