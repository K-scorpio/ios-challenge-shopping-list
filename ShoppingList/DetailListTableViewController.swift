//
//  DetailListTableViewController.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailListTableViewController: UITableViewController, GroceryListTableViewDelegate {
    
    var grocerylist = [GroceryList]()
    
    //MARK: - IBoutlets
    


    //MARK: - IBActions
    
    @IBAction func addButton(sender: AnyObject) {
//        let notification = UILocalNotification()
//        notification.alertTitle = "Add Item"
//        notification.alertBody = "Please add an item to your shopping list"
        let alertController = UIAlertController (title: "Add Item", message: "Please add an item to your shopping list", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Grocery List Name"
        }
        let createAction = UIAlertAction(title: "Create", style: .Default) { (_) in
            guard let textFields = alertController.textFields,
                firstTextField = textFields.first,
                groceryListName = firstTextField.text else {
                    return
            }
            GroceryListController.sharedInstance.addItem(groceryListName)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroceryListController.sharedInstance.groceryLists.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("shoppingListCell", forIndexPath: indexPath) as? GroceryListTableViewCell else {
            return GroceryListTableViewCell()
        }

        // Configure the cell...
        guard let groceryListItem = GroceryListController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? GroceryList else {
            return GroceryListTableViewCell()
        }
        
        cell.textLabel?.text = groceryListItem.name
        cell.updateWithGroceryList(groceryListItem)
        cell.delegate = self
        return cell
        
    }



    func groceryListButtonTapped(sender: GroceryListTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender),
            grocerylist = GroceryListController.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as? GroceryList else {return}
        GroceryListController.sharedInstance.isCompleteValueToggle(grocerylist)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let groceryListItem = GroceryListController.sharedInstance.groceryLists[indexPath.row]
            GroceryListController.sharedInstance.removeItem(groceryListItem)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
