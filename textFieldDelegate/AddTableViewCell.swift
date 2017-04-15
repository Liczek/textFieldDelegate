//
//  AddTableViewCell.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func addTableViewController(_ cell: AddTableViewCell, didFinishAdding newTask: String)
}

class AddTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    weak var delegate: AddTableViewControllerDelegate?
    
    @IBOutlet weak var addTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addTextField.delegate = self

        addTextField.addTarget(self, action: #selector(didEndOnExitTextField), for: .editingDidEndOnExit)
        didEndOnExitTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func didEndOnExitTextField() {
        addTextField.resignFirstResponder()
        let newTask = addTextField.text!
        delegate?.addTableViewController(self, didFinishAdding: newTask)
    }
    
}
