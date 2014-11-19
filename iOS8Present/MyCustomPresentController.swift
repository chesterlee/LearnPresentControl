//
//  MyCustomPresentController.swift
//  iOS8Present
//
//  Created by lee chester on 11/10/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

import UIKit

class MyCustomPresentController: UIPresentationController {
   
    
    lazy var backgroundView :UIView = {

        // containerView是presented和presenting的view的容器
        
        let view = UIView(frame: self.containerView!.bounds)
        view.backgroundColor = UIColor(red: 1.0, green: 1, blue: 0.0, alpha: 0.5)
        view.alpha = 0.0
        return view
        }()
    
    // present开始前
    override func presentationTransitionWillBegin() {

        self.backgroundView.frame.origin.x = -self.containerView.bounds.width
        self.containerView.addSubview(self.backgroundView)
        
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                
                // 此代码将在animation的动画执行中安插
                self.backgroundView.frame.origin.x = 0
                self.backgroundView.alpha = 1.0
                }, completion:nil)
            
            transitionCoordinator.animateAlongsideTransitionInView((view: UIView()), animation: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                // 此代码将在animation的动画执行中安插，手势驱动也会调用
                println("test1")
            }, completion: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                println("test2")
            })
            
            transitionCoordinator.notifyWhenInteractionEndsUsingBlock({ (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                // 手势驱动结束也会调用
                println("test3")
            })
            
        }
    }
    
    // present刚结束
    override func presentationTransitionDidEnd(completed: Bool)  {
        println("present over")
    }
    
    override func dismissalTransitionWillBegin()  {
        
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.backgroundView.alpha  = 0.0
                self.backgroundView.frame.origin.y -= self.containerView.bounds.size.height
                }, completion:nil)
        }
    }
    
    //消失动画结束需要做的操作
    override func dismissalTransitionDidEnd(completed: Bool) {
        
    }
    
    // 展示presented vc和presenting vc的边距
    override func frameOfPresentedViewInContainerView() -> CGRect {

        // insect of the current view controller's frame
        var frame = self.containerView.bounds;
        frame = CGRectInset(frame, 30.0, 30.0)
        return frame
    }
}
