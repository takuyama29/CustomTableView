//
//  ViewController.swift
//  CustomTableView
//
//  Created by 山田卓 on 2017/09/07.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var headerView: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewArray = [UITableViewCell]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make cell height variable
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: FirstTableViewCell.className, bundle: nil), forCellReuseIdentifier: FirstTableViewCell.className)
        
        self.tableView.register(UINib(nibName: SecondTableViewCell.className, bundle: nil), forCellReuseIdentifier: SecondTableViewCell.className)
        
        self.tableView.register(UINib(nibName: ThirdTableViewCell.className, bundle: nil), forCellReuseIdentifier: ThirdTableViewCell.className)
        
        guard let firstTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.className) as? FirstTableViewCell else {
            return
        }
        
        guard let secondTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.className) as? SecondTableViewCell else {
            return
        }
        
        guard let thirdTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.className) as? ThirdTableViewCell else {
            return
        }
        
        self.tableViewArray.append(firstTableViewCell)
        self.tableViewArray.append(secondTableViewCell)
        self.tableViewArray.append(thirdTableViewCell)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    /* Required */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = self.tableViewArray[indexPath.row]
        
        if tableViewCell is FirstTableViewCell {
            return tableViewCell
            
        } else if tableViewCell is SecondTableViewCell {

            return tableViewCell
            
        } else if tableViewCell is ThirdTableViewCell {
            
            // no selectable
            tableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
            return tableViewCell
            
        }
        
        return UITableViewCell()
    }
    
    /* optional */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        headerView.text = tableView.cellForRow(at: indexPath as IndexPath)?.className
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            tableViewArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Erase header cells
        return .leastNormalMagnitude
    }

}

