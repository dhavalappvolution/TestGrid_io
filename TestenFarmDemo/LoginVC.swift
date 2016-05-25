//
//  LoginVC.swift
//  RepuEmp
//
//  Created by Harry on 2/17/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var textPassword: UITextField!
    @IBOutlet var textUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLoginTap(sender: AnyObject) {
        
        let username = textUsername.text
        let password = textPassword.text
        
        // Send a request to login
        PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
            
            if ((user) != nil) {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let employeeListVC = storyboard.instantiateViewControllerWithIdentifier("EmployeeListVC") as! EmployeeListVC
                    self.navigationController?.pushViewController(employeeListVC, animated: false)
                })
                
            } else {
                let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
        
        
//        if(username == "admin" && password == "admin")
//        {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let employeeListVC = storyboard.instantiateViewControllerWithIdentifier("EmployeeListVC") as! EmployeeListVC
//            self.navigationController?.pushViewController(employeeListVC, animated: false)
//          
//            
//        }
        
    }
    @IBAction func DidEndOnExit(sender: AnyObject) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
