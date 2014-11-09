//
//  PopoverViewController.swift
//  iOS8Present
//
//  Created by lee chester on 11/9/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        //cancel button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done,
            target: self,
            action: "done:")
        
        // popover settings
        modalPresentationStyle = .Popover
        self.popoverPresentationController?.delegate = self;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    func done(_ : UIBarButtonItem)
    {
        dismissViewControllerAnimated(true, completion:nil);
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // if you want to adaptive the popover show, this is useful
    func adaptivePresentationStyleForPresentationController(PC: UIPresentationController!) -> UIModalPresentationStyle{
        
        let size = PC.presentingViewController.view.bounds.size

        if (size.width > 320.0)
        {
            //landscape, popover
            return .None
        }
        else
        {
            // portrait, present
            return .FullScreen
        }
    }
    
    func presentationController(_: UIPresentationController!, viewControllerForAdaptivePresentationStyle _: UIModalPresentationStyle)-> UIViewController!{
        return UINavigationController(rootViewController: self)
    }

}
