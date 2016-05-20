//
//  GroceryListTableViewCell.swift
//  ShoppingList
//
//  Created by Kevin Hartley on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class GroceryListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!

    @IBOutlet weak var checkButton: UIButton!
    
    var delegate = ButtonTableViewCellDelegate?()
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            checkButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            checkButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: GroceryListTableViewCell)
}

//extension GroceryListTableViewCell {
//    
//    func updateWithTask(task: Task) {
//        
//        primaryLabel.text = task.name
//        updateButton(task.isComplete.boolValue)
//    }
//}
//
