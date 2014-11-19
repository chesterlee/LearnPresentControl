//
//  CustomPresentViewController.swift
//  iOS8Present
//
//  Created by lee chester on 11/10/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

import UIKit

class CustomPresentViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.statementInit()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.statementInit()
    }
    
    func statementInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ---- UIViewControllerTransitioningDelegate methods
    // 返回要做present动画前，专门控制其view tree层级的转场控制器
    // presented是将要被present的vc、presenting是做present操作的vc（此时还没展示，所以是空）、source是谁调用的present函数的vc
    func presentationControllerForPresentedViewController(presented: UIViewController!, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController!) -> UIPresentationController! {
        
        if presented == self
        {
            return MyCustomPresentController(presentedViewController: presented, presentingViewController: presenting)
        }
        
        return nil
    }
    
    // 返回要做present动画的动画控制器
    // presented是将要被present的vc、presenting是做present操作的vc（是最底层的vc）、source是谁调用的animation函数的vc
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        
        if presented == self {
            return CustomPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }
    
    // 返回要做dismiss动画的动画控制器, dismissed为将要消失的vc
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        
        if dismissed == self {
            return CustomPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }
    
    
    @IBAction func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
