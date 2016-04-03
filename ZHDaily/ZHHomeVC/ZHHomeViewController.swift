//
//  ZHHomeViewController.swift
//  ZHDaily
//
//  Created by ixiazer on 16/3/18.
//  Copyright © 2016年 FF. All rights reserved.
//

import UIKit

class ZHHomeViewController: ZHRootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.redColor()
    }
}
