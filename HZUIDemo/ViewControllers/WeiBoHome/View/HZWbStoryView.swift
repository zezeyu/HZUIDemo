//
//  HZWbStoryView.swift
//  HZUIDemo
//
//  Created by 何泽的mac on 2019/2/11.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

import UIKit

class HZWbStoryView: UIView,NibLoadable {

    @IBOutlet weak var story_View: UIView!
    
    @IBOutlet weak var story_ImageView: UIImageView!
    
    @IBOutlet weak var story_Label: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
