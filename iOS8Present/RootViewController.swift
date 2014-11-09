//
//  RootViewController.swift
//  iOS8Present
//
//  Created by lee chester on 11/9/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // popover button tapped actions
    @IBAction func popOverTapped(sender: AnyObject) {
        
        let story : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : PopoverViewController = story.instantiateViewControllerWithIdentifier("PopoverVCID") as PopoverViewController
        var popPresentationController : UIPopoverPresentationController? = vc.popoverPresentationController
        popPresentationController?.barButtonItem = UIBarButtonItem(customView: sender as UIView)
        popPresentationController?.permittedArrowDirections = .Any
        self.presentViewController(vc, animated: true, completion: nil)
        
    }

    @IBAction func alertTapped(sender: AnyObject) {
        
        let alertControllerSheet : UIAlertController = UIAlertController(title: "test",
            message: "AlertMessage",
            preferredStyle: .Alert)
        
        alertControllerSheet.addAction(UIAlertAction(title: "Confirm",
            style: .Default,
            handler: { (action: UIAlertAction!) -> Void in
            println("press confirm")
        }))
        
        alertControllerSheet.addAction(UIAlertAction(title: "Cancel",
            style: .Cancel,
            handler: { (action: UIAlertAction!) -> Void in
            println("press cancel")
        }))
        
        alertControllerSheet.addAction(UIAlertAction(title: "Delete",
            style: .Destructive,
            handler: { (action: UIAlertAction!) -> Void in
            println("press Delete")
        }))
        
        // briefly action
        alertControllerSheet.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "what's it?"
        }

        self .presentViewController(alertControllerSheet, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetTapped(sender: AnyObject) {
        
        
        let alertControllerSheet : UIAlertController = UIAlertController(title: "test", message: "ActionSheets", preferredStyle: .ActionSheet)
        alertControllerSheet.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            println("confirm")
        }))
        
        alertControllerSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) -> Void in
            println("cancel")
        }))
        
        alertControllerSheet.addAction(UIAlertAction(title: "Delete", style: .Destructive, handler: { (action: UIAlertAction!) -> Void in
            println("Delete")
        }))
        
        // if you do this, program will crash, because textfield can only be added to alert.....
        // by the way, the API will not give some hint..
        
//        alertControllerSheet.addTextFieldWithConfigurationHandler { (textfield) -> Void in
//            textfield.placeholder = "what's it?"
//        }
        
        self .presentViewController(alertControllerSheet, animated: true, completion: nil)
    }
    
    
    
    
    
}
