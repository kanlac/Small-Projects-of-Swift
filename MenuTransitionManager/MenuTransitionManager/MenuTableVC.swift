//
//  MenuTableVC.swift
//  MenuTransitionManager
//
//  Created by serfusE on 03/11/2017.
//  Copyright © 2017 serfusE. All rights reserved.
//

import Foundation
import UIKit

class MenuTableVC: UITableViewController {
    
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu List"
    }
    
    
    // Table view methods.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    // Segue.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
