//
//  ListaTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListaTableViewController: UITableViewController {
    
    
    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        
        fetchData()
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        tableView.reloadData()
        

        print("Liczba elementów w lista: \(dataModel.categorie.count)")
    }
    
//    func addTableViewController(_ cell: AddTableViewCell, didFinishAdding newTask: String) {
//        let newIndex = lista.count
//        lista.append(newTask)
//        let indexPath = IndexPath(row: newIndex, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//        print("lista count after append: \(newTask)")
//        tableView.reloadData()
//        dismiss(animated: true, completion: nil)
//    }    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataModel.categorie.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let task = dataModel.categorie[indexPath.row]
        cell.textLabel?.text = task.value(forKey: "categoriaName") as? String
        return cell
    }
    
    func fetchData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Categoria")
        
        do {
            dataModel.categorie = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Fetch data problem\(error), \(error.userInfo)")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
