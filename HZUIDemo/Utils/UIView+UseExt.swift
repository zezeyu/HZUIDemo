//
//  UIView+UseExt.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/11.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor : UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    //MARK: -添加点击事件
    public func addTapGesture(target:Any, selector:Selector) {
        self.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(singleTap)
    }
    
}
