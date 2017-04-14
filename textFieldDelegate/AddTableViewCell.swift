//
//  AddTableViewCell.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func setNew(_ cell: AddTableViewCell, didSetNew taskName: String)
}

class AddTableViewCell: UITableViewCell {
    
    
    weak var delegate: AddTableViewControllerDelegate?
    
    @IBOutlet weak var addTextField: UITextField!
    
    
    @IBAction func setNewTaskName(_ sender: Any) {
        let taskName = addTextField.text!
        print(taskName)
        delegate?.setNew(self, didSetNew: taskName)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
