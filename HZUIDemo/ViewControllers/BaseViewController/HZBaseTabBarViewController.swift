//
//  HZBaseTabBarViewController.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/8.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

class HZBaseTabBarViewController: QMUITabBarViewController {

    override func viewDidLoad() {
        addItems()
    }
}

extension HZBaseTabBarViewController {
    private func addItems() {
        let weiboVC = HZWeiBoHomeViewController()
        let alipayVC = HZAlipayHomeViewController()
        let componentVC = HZComponentViewController()
        let aboutVC = HZAboutViewController()
        let arr = [weiboVC,alipayVC,componentVC,aboutVC]
        let titleArr = ["微博","支付宝","组件","个人"]
        let picArr = ["","","",""]
        let picSelectArr = ["","","",""]
        for (index,model) in arr.enumerated() {
            addChildVc(model, titleArr[index], picArr[index], picSelectArr[index])
        }
    }
    
    private func addChildVc(_ childVc:UIViewController,_ title:String,_ image:String,_ selectedImage:String){
        childVc.tabBarItem.title = title
        childVc.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        let mainNav = HZBaseNavigationController.init(rootViewController: childVc)
        self.addChild(mainNav)
    }
    //调整item的文字颜色和字体大小
    private func changeItemTextColourAndFont(){
        
    }
}
