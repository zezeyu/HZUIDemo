//
//  HZWeiBoHomeViewController.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/8.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit
fileprivate struct Metric {
    static let toastHeight:CGFloat = 34.hr
    static let topHeight:CGFloat = is_iPhoneX ? 102 : 102.hr
    static let topColor:UIColor = RGB(r: 250, g: 250, b: 250)
}
class HZWeiBoHomeViewController: HZBaseViewController {

    lazy var toastView = HZWbToastView(frame: .zero).then{
        self.view.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(self.qmui_navigationBarMaxYInViewCoordinator)
            make.height.equalTo(Metric.toastHeight)
        }
    }
    lazy var topView = HZWbTopView().then{
        self.view.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.top.equalTo(toastView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(Metric.topHeight)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "微博"
        initUI()
        topView.addTapGesture(target: self, selector: #selector(bindUI))
    }
    
}
// MARK: - UI
extension HZWeiBoHomeViewController {
    
    private func initUI() {
        toastView.updateWeiboNumber(num: 6)
        topView.backgroundColor = Metric.topColor
    }
    
    @objc private func bindUI() {
        toastView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(self.qmui_navigationBarMaxYInViewCoordinator + 50)
        }
    }
}
