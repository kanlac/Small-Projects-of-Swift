//
//  MainTableViewController.swift
//  Counter
//
//  Created by serfusE on 08/07/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit
import os.log

class MainTableViewController: UITableViewController {
    
    var itemsNames = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedItems = loadItems() {
            itemsNames = savedItems
        } else {
            loadSampleItems()
        }
    }
    
    // MARK: Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (itemsNames.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cellName = itemsNames[indexPath.row].name
        cell.textLabel?.text = cellName
        return (cell)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemsNames.remove(at: indexPath.row)
            saveItems()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checkList = itemsNames[indexPath.row]
        performSegue(withIdentifier: "ShowDetail", sender: checkList)
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new item. ", log: OSLog.default, type: .debug)
        
        case "ShowDetail":
            os_log("Editing item. ", log: OSLog.default, type: .debug)
        
            /* abandoned code.
            guard let selectedItemCell = sender as? UITableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
        
            guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not dispalyed in main table. ")
            }
            
            guard let newItemViewController = segue.destination as? ItemViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
        
            let selectedItem = itemsNames[indexPath.row]
            newItemViewController.currentItem = selectedItem
            */
            
            guard let detailItemViewController = segue.destination as? ItemViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            detailItemViewController.currentItem = sender as? Item

            
        default:
            fatalError("Unexpected identifier. ")
            
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func unwindToMainTable (sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ItemViewController, let newItem = sourceViewController.currentItem {
            
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
                itemsNames[selectedRowIndexPath.row] = newItem
                tableView.reloadRows(at: [selectedRowIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: itemsNames.count, section: 0)
                itemsNames.append(newItem)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
        }
        
        saveItems()
    }
    
    // MARK: Private Methods
    
    private func loadSampleItems() {
        // Notice: these constants are optional.
        let item0 = Item(name: "test00")
        let item1 = Item(name: "test01")
        let item2 = Item(name: "test02")
        
        itemsNames += [item0!, item1!, item2!]
    }
    
    private func loadItems() -> [Item]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Item.ArchiveURL.path) as? [Item]
    }
    
    private func saveItems() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(itemsNames, toFile: Item.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Items successful saved. ", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save items… ", log: OSLog.default, type: .error)
        }
    }
    
    
}
