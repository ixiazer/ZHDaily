//
//  ZHMainViewController.swift
//  ZHDaily
//
//  Created by ixiazer on 16/3/18.
//  Copyright © 2016年 FF. All rights reserved.
//

import UIKit

class ZHMainViewController: ZHRootViewController {
    var defaultVC: ZHRootViewController!
    var leftMenuVC: ZHRootViewController!
    var mainView: UIView! = UIView(frame: CGRectMake(SliderWidthScale*ScreenWidth, 0, ScreenWidth, ScreenHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initWithSliverViewDefault(ZFMenuViewController(), defaultView: ZHHomeViewController())
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    func initWithSliverViewDefault(leftMenu: ZHRootViewController!, defaultView: ZHRootViewController!) {
        leftMenuVC = leftMenu;
        defaultVC = defaultView
        
        mainView.addSubview(defaultVC.view)
        self.view.addSubview(leftMenu.view)
        self.view.addSubview(mainView)
    }
}
