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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "微博"
        initUI()
    }
    
}
// MARK: - UI
extension HZWeiBoHomeViewController {
    func initUI() {
        toastView.updateWeiboNumber(num: 6)
    }
    
}
