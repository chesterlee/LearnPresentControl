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
        view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        view.alpha = 0.0
        view.frame.origin.x = -view.bounds.size.width
        return view
        }()
    
    // present开始前
    override func presentationTransitionWillBegin() {

        self.backgroundView.frame = self.containerView.bounds
        self.backgroundView.frame.origin.x = -self.containerView.bounds.width
        self.containerView.addSubview(self.backgroundView)
        self.containerView.addSubview(self.presentedView())
        
        // Fade in the dimming view alongside the transition
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            
            //TODO:学习这个协议
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.backgroundView.frame.origin.x = 0
                self.backgroundView.alpha = 1.0
                }, completion:nil)
        }
    }
    
    // present刚结束
    override func presentationTransitionDidEnd(completed: Bool)  {
        
        if !completed {
            self.backgroundView.removeFromSuperview()
        }
        
    }
    
    override func dismissalTransitionWillBegin()  {
        
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.backgroundView.alpha  = 0.0
                self.backgroundView.frame.origin.x = self.containerView.bounds.size.width
                }, completion:nil)
        }
    }
    
    //消失动画结束需要做的操作
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.backgroundView.removeFromSuperview()
        }
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {

        // insect of the current view controller's frame
        var frame = self.containerView.bounds;
        frame = CGRectInset(frame, 30.0, 30.0)
        return frame
    }
    
    
    // ---- UIContentContainer protocol methods
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator transitionCoordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: transitionCoordinator)
        
        transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.backgroundView.frame = self.containerView.bounds
            }, completion:nil)
    }
}
