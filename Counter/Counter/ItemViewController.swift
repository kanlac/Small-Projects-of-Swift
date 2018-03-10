//
//  ItemViewController.swift
//  Counter
//
//  Created by serfusE on 09/07/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit
import os.log

class ItemViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var currentItem: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        if let Item = currentItem {
            textField.text = Item.name
        }
    }
    
    // MARK: UITextFieldDelegate
    
    
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The Save button was not pressed, canceling…", log: OSLog.default, type: .debug)
            return
        }
        
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "ShowDetail" {
                
            }
        }
        
        let text = textField.text ?? ""
        currentItem = Item(name: text)
        
    }
    
    
}
