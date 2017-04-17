//
//  AddTableViewCell.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol AddTableViewCellDelegate : class {
    func addTableViewCell(_ cell: AddTableViewCell, didFinishAdding newName: String)
}

class AddTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    weak var delegate: AddTableViewCellDelegate?
    
    @IBOutlet weak var addTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addTextField.delegate = self
        self.addTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
    }
    
    func didChangeEditing() {
        let newName = addTextField.text!
        delegate?.addTableViewCell(self, didFinishAdding: newName)
    }
    
}
