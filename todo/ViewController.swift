//
//  ViewController.swift
//  todo
//
//  Created by 胡秉诚 on 12/16/20.
//

import UIKit

class ViewController: UITableViewController {
    
    private var todoItems = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TODO DEMO"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.didTapAddItemButton(_:)))
        // Do any additional setup after loading the view.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row < todoItems.count {
            let item = todoItems[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_todo", for: indexPath)
        
        if indexPath.row < todoItems.count {
            let item = todoItems[indexPath.row]
            cell.textLabel?.text = item.title
            
            
            let accessory: UITableViewCell.AccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }
        return cell
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem) {
        // Create an alert
        let alert = UIAlertController(
            title: "New to-do item",
            message: "Insert the title of the new to-do item:",
            preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text
            {
                self.addNewToDoItem(title: title)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func addNewToDoItem(title: String) {
        let newIndex = todoItems.count
        todoItems.append(ToDoItem(title: title))
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if indexPath.row < todoItems.count
            {
                todoItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .top)
            }
        }
    

}

