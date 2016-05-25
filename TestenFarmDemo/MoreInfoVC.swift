//
//  MoreInfoVC.swift
//  RepuEmp
//
//  Created by Harry on 2/19/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
class MoreInfoVC: UIViewController {
    
    
    @IBOutlet weak var stackMainView: UIView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        stackView = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.Vertical
        stackView.distribution  = UIStackViewDistribution.EqualSpacing
        stackView.alignment = UIStackViewAlignment.Center
        stackView.spacing   = 30
      
        let address:UILabel = UILabel(frame: CGRectMake(0 ,0, self.view.frame.size.width, 40));
        address.textAlignment = NSTextAlignment.Center;
        address.numberOfLines = 0;
        address.font = UIFont.systemFontOfSize(16.0);
        address.text = "Physical Address :\n1946 LOMA ALTA RD,\nIRVING, TX 75063";
        stackView.addArrangedSubview(address)
        
        let caddress:UILabel = UILabel(frame: CGRectMake(0 ,0, self.view.frame.size.width, 40));
        caddress.textAlignment = NSTextAlignment.Center;
        caddress.numberOfLines = 0;
        caddress.font = UIFont.systemFontOfSize(16.0);
        caddress.text = "Communication Address :\n3423 Piedmont Rd NE,\nAtlanta, GA 30305";
        stackView.addArrangedSubview(caddress)
        
        let education:UILabel = UILabel(frame: CGRectMake(0 ,0, self.view.frame.size.width, 40));
        education.textAlignment = NSTextAlignment.Center;
        education.numberOfLines = 0;
        education.font = UIFont.systemFontOfSize(16.0);
        education.text = "Education :\nBachelor of Computer Science\nMaster of Computer Science";
        stackView.addArrangedSubview(education)

        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackMainView.addSubview(stackView)
        
        stackView.centerXAnchor.constraintEqualToAnchor(stackMainView.centerXAnchor).active = true
        stackView.topAnchor.constraintEqualToAnchor(stackMainView.topAnchor).active = true
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

