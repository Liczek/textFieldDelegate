//
//  TasksTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 17.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class TasksTableViewController: UITableViewController {
    
    
    
    var zadania
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        
        cell.textLabel?.text = "test"
        return cell
    }
}
