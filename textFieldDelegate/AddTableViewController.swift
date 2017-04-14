//
//  AddTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class AddTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    
  

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UINib(nibName: "AddTableViewCell", bundle: nil), forCellReuseIdentifier: "AddCell")
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell") as! AddTableViewCell
        cell.addTextField.delegate = self
        cell.addTextField.placeholder = "Enter new task name"
        return cell
    }
    
    
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        
        
    }
    

}
