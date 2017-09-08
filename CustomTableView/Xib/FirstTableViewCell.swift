//
//  FirstTableViewCell.swift
//  CustomTableView
//
//  Created by 山田卓 on 2017/09/07.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Erase border
        separatorInset = UIEdgeInsets(top: 0, left: bounds.width, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
