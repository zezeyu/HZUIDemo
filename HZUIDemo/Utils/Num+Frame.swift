//
//  Num+Frame.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/10.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

class Screen {
    
    //UI设计图标准高宽 375 667
    static var UI_WIDTH:CGFloat = 375
    static var UI_HEIGHT:CGFloat = 667
    
    //屏幕适配宽度比例系数
    static let widthRatio:CGFloat = kScreenWidth / UI_WIDTH
    //屏幕适配比例系数 高度
    //minus 为不拉伸部分 0 代表全部拉伸
    //                20 不拉伸状态栏
    //                64 不拉伸状态栏+导航栏
    //               108 不拉伸状态栏+导航栏+Tab
    static var minusOffset:CGFloat = 0
    static var heightRatio:CGFloat {
        get {
            return (kScreenHeight - minusOffset) / (UI_HEIGHT - minusOffset)
        }
    }
    
}

extension Int {
    var wr:CGFloat {
        get {
            return CGFloat(self) * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return CGFloat(self) * Screen.heightRatio
        }
    }
    var cg:CGFloat {
        get {
            return CGFloat(self)
        }
    }
}
extension Double {
    var wr:CGFloat {
        get {
            return CGFloat(self) * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return CGFloat(self) * Screen.heightRatio
        }
    }
    var cg:CGFloat {
        get {
            return CGFloat(self)
        }
    }
}

extension CGFloat {
    var wr:CGFloat {
        get {
            return self * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return self * Screen.heightRatio
        }
    }
}

extension NSLayoutConstraint {
    @IBInspectable var wr:CGFloat {
        get {
            return self.constant * Screen.widthRatio
        }
    }
    @IBInspectable var hr:CGFloat {
        get {
            return self.constant * Screen.heightRatio
        }
    }
}

