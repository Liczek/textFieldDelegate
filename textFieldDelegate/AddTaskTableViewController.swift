//
//  AddTaskTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 17.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddTaskTableViewController: UITableViewController, UITextFieldDelegate, AddTableViewCellDelegate {
    
    
    var newZadanieName = ""
    
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddTableViewCell
        cell.delegate = self
        cell.addTextField.placeholder = "Enter Task name here."
        return cell
    }
    
    func addTableViewCell(_ cell: AddTableViewCell, didFinishAdding newName: String) {
        self.newZadanieName = newName
    }
    
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        save(zadanieName: newZadanieName)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func save(zadanieName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let zadanieNameEntity = NSEntityDescription.entity(forEntityName: "Zadanie", in: managedContext)!
        let zadanie = NSManagedObject(entity: zadanieNameEntity, insertInto: managedContext)
        zadanie.setValue(zadanieName, forKey: "zadanieName")
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Save zadanieName failed: \(error), \(error.userInfo)")
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
