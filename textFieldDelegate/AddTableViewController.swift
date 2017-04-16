//
//  AddTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddTableViewController: UITableViewController, UITextFieldDelegate, AddTableViewCellDelegate {

    var newTaskName = ""
    
    var dataModel: DataModel!

    
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
        cell.delegate = self
        cell.addTextField.placeholder = "Enter new task name"
        cell.addTextField.text = self.newTaskName
        return cell
    }
    
    func addTableViewCell(_ cell: AddTableViewCell, didFinishAdding newTask: String) {
        self.newTaskName = newTask
        print(newTask)
    }
    
    
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        save(taskName: newTaskName)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func save(taskName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Zadanie", in: managedContext)!
        
        let zadanie = NSManagedObject(entity: entity, insertInto: managedContext)
        
        zadanie.setValue(taskName, forKey: "taskName")
        
        
        do {
            try managedContext.save()
//?????? dataModel.zadania.append(zadanie) ?????? wcześniej miałem taki kod a teraz jak go wpisuje to nil mi wywala, skoro same setValue dodaje wartosc do DataCore to po co jeszcze się robiło append do arreyki? w tamtym przypadku był to categories: [NSManagedObject] = []
        } catch let error as NSError {
            print(error)
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
