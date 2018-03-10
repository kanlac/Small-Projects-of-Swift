//
//  TableVC.swift
//  MenuTransitionManager
//
//  Created by serfusE on 03/11/2017.
//  Copyright © 2017 serfusE. All rights reserved.
//

import Foundation
import UIKit

class TableVC: UITableViewController, MenuTransitionManagerDelegate {
    
    let menuTransitionManager = MenuTransitionManager()
    let stringItems = ["string item 1", "string item 2", "string item 3", "string item 4", "string item 5", "string item 6", "string item 7", "string item 8"]
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // VC methods.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sample App"
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }
    
    
    // Table view methods.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = stringItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    // Segue.
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        //let sourceController = segue.source as! MenuTableVC
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableVC = segue.destination as! MenuTableVC
        menuTableVC.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
    }
    
}
