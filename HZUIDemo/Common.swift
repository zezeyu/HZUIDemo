//
//  Common.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/7.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

///全屏宽
let kScreenWidth = UIScreen.main.bounds.width
///全屏高
let kScreenHeight = UIScreen.main.bounds.height
///获取状态栏的高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
///获取导航栏的高度
let kNavBarHeight:CGFloat = 44.0
///获取整个导航栏的高度 （状态栏加导航栏）
let kTopHeight = (kStatusBarHeight + kNavBarHeight)
///获取底部tabber高度
let hasHeader = kStatusBarHeight > 20
let kTabBarHeight = hasHeader ? 83 : 49
///4s和5s 宽
let kiOS4S_5S:CGFloat = 320.0
///6s和7宽
let kiOS6S:CGFloat = 375.0
///iOS6plus宽
let kiOS6Plus:CGFloat = 414.0
///系统当前系统版本
func IS_IOS() -> Double {
    
    return Double(UIDevice.current.systemVersion as String)!
}
///RGB颜色转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}
func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
//////颜色
///item的文字颜色
let itemTextColor:UIColor = UIColor.qmui_color(withHexString: "#8a8a8a")!
let itemSelectedTextColor:UIColor = UIColor.qmui_color(withHexString: "#1296db")!
///页面背景色
let VCBackgroundColor:UIColor = RGB(r: 235.0, g: 235.0, b: 235.0)
///字体颜色
let textColor_normal:UIColor = RGB(r: 51.0, g: 51.0, b: 51.0)
///微博主调色橙色
let Wb_Color_normal:UIColor = RGB(r: 225, g: 175, b: 100)

///判断是不是iphone x
let is_iPhoneX = hasHeader ? true : false
//封装的日志输出功能（T表示不指定日志信息参数类型）
func HZLog<T>(_ message:T, file:String = #file, function:String = #function,
               line:Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    if message is Dictionary<String, Any> {
        print("[\(fileName):line:\(line)]- \((message as! Dictionary<String, Any>).description)")
    }else if message is Array<Any> {
        print("[\(fileName):line:\(line)]- \((message as! Array<Any> ).description)")
    }else if message is CustomStringConvertible {
        print("[\(fileName):line:\(line)]- \((message as! CustomStringConvertible).description)")
    }else {
        print("[\(fileName):line:\(line)]- \(message)")
    }
    #endif
}
