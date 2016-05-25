//
//  ViewController.swift
//  Test
//
//  Created by Harry on 3/16/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDoneClicked(sender: AnyObject) {
        self.nameText.resignFirstResponder()
        lblName.text = nameText.text;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.nameText.resignFirstResponder()
        return true;
    }

}

