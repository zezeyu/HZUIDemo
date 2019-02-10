//
//  NibLoadable.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/10.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

protocol NibLoadable { }

extension NibLoadable where Self : UIView {
    
    static func loadFromNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
