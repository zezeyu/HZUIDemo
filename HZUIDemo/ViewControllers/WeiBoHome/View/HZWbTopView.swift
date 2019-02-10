//
//  HZWbTopView.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/10.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit
import ReusableKit

fileprivate struct Metric {
    static let margin:CGFloat = 10.wr
    static let height:CGFloat = 102.hr
    static let gs_width:CGFloat = 54.wr //微博故事宽度
    static let gs_circle:CGFloat = 2.5.wr //故事的线圈
    static let bgColor:UIColor = RGB(r: 225, g: 175, b: 100)
    static let textSize:CGFloat = 15.wr
}

class HZWbTopView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = VCBackgroundColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
