//
//  ZHMainViewController.swift
//  ZHDaily
//
//  Created by ixiazer on 16/3/18.
//  Copyright © 2016年 FF. All rights reserved.
//

import UIKit

enum ZHMainViewType {
    case ZHMainViewMain
    case ZHMainViewMenuShow
    case ZHMainViewMenuMoving
}

class ZHMainViewController: ZHRootViewController, UIGestureRecognizerDelegate {
    var mainViewType: ZHMainViewType = ZHMainViewType.ZHMainViewMain
    var defaultVC: ZHRootViewController!
    var leftMenuVC: ZHRootViewController!
    var mainView: UIView! = UIView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
    
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
    
    func resetEnd(endX: CGFloat, currentX: CGFloat) {
//        var animateTime: CGFloat = 0.3
        if (endX == ScreenWidth*SliderWidthScale) {
//            animateTime = (ScreenWidth*SliderWidthScale-originX)/ScreenWidth*SliderWidthScale*0.3
        } else if (endX == 0.0) {
        }
        
        let frame: CGRect = CGRectMake(endX, 0, ScreenWidth, ScreenHeight)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.mainViewType = ZHMainViewType.ZHMainViewMenuMoving;
            self.mainView.frame = frame;
            }, completion: { (finished: Bool) -> Void in
                self.resetMainStatus(endX)
        })
    }
    
    func resetMainStatus(mainViewEndX: CGFloat) {
        let frame: CGRect = CGRectMake(mainViewEndX, 0, ScreenWidth, ScreenHeight)
        self.mainView.frame = frame;
        if (mainViewEndX == 0.0) {
            self.mainViewType = ZHMainViewType.ZHMainViewMain;
        } else if (mainViewEndX == ScreenWidth*SliderWidthScale) {
            self.mainViewType = ZHMainViewType.ZHMainViewMenuShow;
        }
    }
    
    func initWithSliverViewDefault(leftMenu: ZHRootViewController!, defaultView: ZHRootViewController!) {
        leftMenuVC = leftMenu;
        defaultVC = defaultView
        
        mainView.addSubview(defaultVC.view)
        
        self.view.addSubview(leftMenu.view)
        self.view.addSubview(mainView)
        
        self.addGuesture(mainView)
    }
    
    func addGuesture(view: UIView) {
        //绑定手势事件
        let panGus:UIPanGestureRecognizer! = UIPanGestureRecognizer()
        panGus.delegate = self
        panGus.addTarget(self, action: "panGesReceive:")
        view.addGestureRecognizer(panGus)
    }
    
    func panGesReceive(panGues: UIPanGestureRecognizer) {
        if (mainViewType == ZHMainViewType.ZHMainViewMenuMoving) {
            return
        }
        
        let translation:CGPoint = panGues.translationInView(self.view)
        
        if (panGues.state == UIGestureRecognizerState.Began) {
            if (mainView.frame.origin.x == 0) {
                self.mainViewType = ZHMainViewType.ZHMainViewMain;
            } else {
                self.mainViewType = ZHMainViewType.ZHMainViewMenuShow;
            }
        } else if (panGues.state == UIGestureRecognizerState.Changed) {
            let moveX: CGFloat = translation.x
            NSLog("moveX---->>%.2f",moveX)
            
            if (mainViewType == ZHMainViewType.ZHMainViewMain) {
                if (moveX > 0) {
                    mainView.frame = CGRectMake(moveX, 0, ScreenWidth, ScreenHeight)
                }
            } else if (mainViewType == ZHMainViewType.ZHMainViewMenuShow) {
                if (moveX < 0) {
                    mainView.frame = CGRectMake(ScreenWidth*SliderWidthScale+moveX, 0, ScreenWidth, ScreenHeight)
                }
            }
        } else if (panGues.state == UIGestureRecognizerState.Ended) {
            let endOriginX: CGFloat = translation.x
            if (mainViewType == ZHMainViewType.ZHMainViewMain) {
                if (endOriginX >= 0 && endOriginX < 50) {
                    self.resetEnd(0, currentX: endOriginX)
                } else {
                    self.resetEnd(ScreenWidth*SliderWidthScale, currentX: endOriginX)
                }
            } else if (mainViewType == ZHMainViewType.ZHMainViewMenuShow) {
                if (endOriginX >= ScreenWidth*SliderWidthScale - 50 && endOriginX < ScreenWidth*SliderWidthScale) {
                    self.resetEnd(ScreenWidth*SliderWidthScale, currentX: endOriginX)
                } else {
                    self.resetEnd(0, currentX: endOriginX)
                }
            }
        }
    }
}
