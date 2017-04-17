//
//  TasksTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 17.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TasksTableViewController: UITableViewController {
    
    
    
    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.zadania.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        let zadanie = dataModel.zadania[indexPath.row]
        cell.textLabel?.text = zadanie.value(forKey: "zadanieName") as? String
        
        return cell
    }
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Zadanie")
        
        do {
           dataModel.zadania = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("fetch zadania failed: \(error), \(error.userInfo)")
        }
    }
    
}
