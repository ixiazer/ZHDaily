//
//  ZFMenuViewController.swift
//  ZHDaily
//
//  Created by ixiazer on 16/3/18.
//  Copyright © 2016年 FF. All rights reserved.
//

import UIKit

class ZFMenuViewController: ZHRootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: SliderWidthScale*ScreenWidth, height: ScreenHeight)
        self.view.backgroundColor = UIColor.redColor();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.orangeColor()
    }
}
