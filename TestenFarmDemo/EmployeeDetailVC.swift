//
//  EmployeeDetailVC.swift
//  RepuEmp
//
//  Created by Harry on 2/17/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit
import LocalAuthentication

class EmployeeDetailVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var fname = String()
    var lname = String()
    var designation = String()
    var joindate = String()
    var phoneno = String()
    var linkedinprofile = String()
    

    
    @IBOutlet var labelLName: UILabel!
    @IBOutlet var labelFName: UILabel!

    @IBOutlet var labelDesignation: UILabel!
    
    @IBOutlet weak var buttonPhoneNumber: UIButton!
    
    @IBOutlet weak var buttonLinkedInID: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        labelFName.text = fname
        labelLName.text = lname
        labelDesignation.text = designation
        buttonPhoneNumber.setTitle(phoneno, forState: UIControlState.Normal)
        buttonLinkedInID.setTitle(linkedinprofile, forState: UIControlState.Normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapBack(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    @IBAction func onTapCall(sender: AnyObject) {
        
//        authenticateUser()
        let phoneNumber = self.buttonPhoneNumber.titleLabel!.text
        if(phoneNumber != nil)
        {
            self.callNumber(phoneNumber!)
        }
    }
    
    private func callNumber(phoneNumber:String) {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            fatalError("Device doesn't support call functionality")
        }
        else {
            if let phoneCallURL:NSURL = NSURL(string: "tel:\(phoneNumber)") {
                let application:UIApplication = UIApplication.sharedApplication()
                
                if(application.canOpenURL(phoneCallURL)) {
                    application.openURL(phoneCallURL);
                }
                else {
                    fatalError("Device doesn't support call functionality")
                }
            }
        }
    }
    
    
    @IBAction func onTapBrowse(sender: AnyObject) {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            let linkedIn = buttonLinkedInID.titleLabel?.text
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let linkedInInVC = storyboard.instantiateViewControllerWithIdentifier("LinkedInInVC") as! LinkedInInVC
            linkedInInVC.URL = linkedIn
            
            if #available(iOS 8.0, *) {
                linkedInInVC.modalPresentationStyle = UIModalPresentationStyle.Popover
                
                let popover = linkedInInVC.popoverPresentationController
                linkedInInVC.preferredContentSize = CGSizeMake(500,600)
                popover!.delegate = self
                popover!.sourceView = self.view
                popover!.sourceRect =  self.view.convertRect((sender as! UIButton).frame, fromView:(sender as! UIButton).superview)
                
                self.presentViewController(linkedInInVC, animated: true, completion: nil)
            }
            else {
                
                fatalError("Popover will not be working in below iOS 8.0 version")
            }
        }
        else {
            
            fatalError("Popover is not supported in iPhone")
        }
    }
    
    func authenticateUser() {
        let touchIDManager : TouchIDUtility = TouchIDUtility()
        
        touchIDManager.authenticateUser(success: { () -> () in
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                
                let phoneNumber = self.buttonPhoneNumber.titleLabel!.text
                if(phoneNumber != nil)
                {
                    self.callNumber(phoneNumber!)
                }
            })
            }, failure: { (evaluationError: NSError) -> () in
                
                if #available(iOS 8.0, *) {
                    switch evaluationError.code {
                    case LAError.SystemCancel.rawValue:
                        fatalError("Authentication cancelled by the system")
                        break;
                    case LAError.UserCancel.rawValue:
                        fatalError("Authentication cancelled by the user")
                        break;
                    case LAError.UserFallback.rawValue:
                        fatalError("User wants to use a password")
                        break;
                    case LAError.TouchIDNotEnrolled.rawValue:
                        fatalError("TouchID is not enrolled")
                        break;
                    case LAError.PasscodeNotSet.rawValue:
                        fatalError("Passcode is not set")
                        break;
                    default:
                        fatalError("Authentication failed")
                    }
                } else {
                    // Fallback on earlier versions
                    fatalError("Will not be working in below iOS 8.0 version")
                }
        })
    }
    
    @IBAction func onTapMore(sender: AnyObject) {
        
        if #available(iOS 9.0, *) {
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            self.storyboard
            let moreInfoVC = self.storyboard!.instantiateViewControllerWithIdentifier("MoreInfoVC") as! MoreInfoVC
            self.navigationController?.pushViewController(moreInfoVC, animated: true)
        } else {
            
            fatalError("More information is using Stack View which is not available in below iOS 9.0 version")
        }
    }
}
