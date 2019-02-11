//
//  HZWbTopView.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/10.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

fileprivate struct Metric {
    static let margin:CGFloat = 10.wr
    static let height:CGFloat = is_iPhoneX ? 102 : 102.hr
    static let storyWidth:CGFloat = 68.wr
    static let gs_width:CGFloat = 55.wr //微博故事按钮宽度
    static let gs_circle:CGFloat = 2.5.wr //故事的线圈
    static let bgColor:UIColor = RGB(r: 250, g: 250, b: 250)
    static let textSize:CGFloat = 15.wr
}

class HZWbTopView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: Metric.height)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension HZWbTopView {
    func initUI() {
        self.backgroundColor = Metric.bgColor
        self.contentSize = CGSize(width: kScreenWidth, height: Metric.height)
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        //刚初始化时只有一个微博故事，就是自己的（我的故事，请求到数据后为多几个故事）
        _ = HZWbStoryView.loadFromNib().then{
            $0.frame = CGRect(x: Metric.margin, y: 0, width: Metric.storyWidth, height: Metric.height)
            self.addSubview($0)
        }
        
        
    }
}
