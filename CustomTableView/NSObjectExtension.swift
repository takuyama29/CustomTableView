//
//  NSObjectExtension.swift
//  CustomTableView
//
//  Created by 山田卓 on 2017/09/07.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
