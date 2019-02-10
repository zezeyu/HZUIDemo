//
//  HZWbToastView.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/10.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

fileprivate struct Metric {
    static let height:CGFloat = 34.hr
    static let bgColor:UIColor = RGB(r: 225, g: 175, b: 100)
    static let textSize:CGFloat = 17.wr
}
class HZWbToastView: UIView {

    var numLabel:UILabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: Metric.textSize)
        $0.textColor = UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Metric.bgColor
        initUI()
    }
    //更新了多少条微博
    func updateWeiboNumber(num:Int) {
        numLabel.text = "更新了\(num)条微博"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HZWbToastView {
    func initUI() {
        self.addSubview(numLabel)
        numLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    func height() ->CGFloat {
        return Metric.height
    }
}
