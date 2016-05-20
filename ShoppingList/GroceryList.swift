//
//  GroceryList.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class GroceryList: Equatable {
    
    var checked: Bool
    var title: String
    
    init(checked: Bool, title: String) {
        self.checked = checked
        self.title = title
    }
}

func ==(lhs: GroceryList, rhs: GroceryList) -> Bool {
    return lhs.checked == rhs.checked && lhs.title == rhs.title
}

//protocol GroceryListDelegate {
//    func checked()
//}
