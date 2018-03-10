//
//  ViewController.swift
//  CustomFont
//
//  Created by serfusE on 23/09/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        changeFontButton.layer.cornerRadius = 55
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Properties
    
    var strs = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project",
                "测试测试测试测试测试测试",
                "123",
                "@@@@@@"]
    var fontNames = ["MFJinHei_Noncommercial-Regular", "MFTongXin_Noncommercial-Regular"]
    var fontIndex = 1
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeFontButton: UIButton!
    
    
    // MARK: TableView Methods
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strs.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 16)
        cell.textLabel?.text = strs[indexPath.row]
        return cell
    }
    
    
    // MARK: Action
    
    @IBAction func changeFontButton(_ sender: Any) {
        fontIndex = fontIndex == 1 ? 0 : 1
        tableView.reloadData()
    }
    
    


}

