//
//  LinkedInInVC.swift
//  RepuEmp

//
//  Created by Harry on 2/17/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class LinkedInInVC: UIViewController,UIWebViewDelegate {
    
    var URL: String!

    @IBOutlet var liWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       let fullURL = URL

        let url = NSURL(string: fullURL)
        let requestObj = NSURLRequest(URL: url!)
        liWebView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
