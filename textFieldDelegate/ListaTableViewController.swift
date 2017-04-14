//
//  ListaTableViewController.swift
//  textFieldDelegate
//
//  Created by Paweł Liczmański on 14.04.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class ListaTableViewController: UITableViewController, AddTableViewControllerDelegate {
    
    
    var lista = ["dom", "praca", "sport"]
    
    let addTableViewCell = AddTableViewCell.self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        print("Liczba elementów w lista: \(lista.count)")
    }
    
    func setNew(_ cell: AddTableViewCell, didSetNew taskName: String) {
        lista.append(taskName)
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return lista.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let task = lista[indexPath.row]
        cell.textLabel?.text = task
        return cell
    }
    
    
    
}