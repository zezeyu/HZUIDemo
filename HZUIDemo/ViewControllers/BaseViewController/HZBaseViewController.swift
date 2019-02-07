//
//  HZBaseViewController.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/7.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

class HZBaseViewController: QMUICommonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
