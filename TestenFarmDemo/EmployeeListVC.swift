//
//  EmployeeListVC.swift
//  RepuEmp
//
//  Created by Harry on 2/17/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var dataarr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let query = PFUser.query()
        query!.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                self.dataarr = objects as! NSMutableArray
                self.tableView.reloadData()
            } else {
                print("Error: \(error) \(error!.userInfo)")
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as! ListViewCell
        cell.fnameLabel.text = dataarr[indexPath.row].valueForKey("fname") as? String
        cell.lnameLabel.text = dataarr[indexPath.row].valueForKey("lname") as? String
        cell.designationLabel.text = dataarr[indexPath.row].valueForKey("designation") as? String
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //print(dataarr[indexPath.row])
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeDetailVC = storyboard.instantiateViewControllerWithIdentifier("EmployeeDetailVC") as! EmployeeDetailVC
        
        employeeDetailVC.fname = (dataarr[indexPath.row].valueForKey("fname") as? String)!
        employeeDetailVC.lname = (dataarr[indexPath.row].valueForKey("lname") as? String)!
        employeeDetailVC.designation = (dataarr[indexPath.row].valueForKey("designation") as? String)!
        employeeDetailVC.joindate = (dataarr[indexPath.row].valueForKey("joiningdate") as? String)!
        employeeDetailVC.phoneno = (dataarr[indexPath.row].valueForKey("phoneno") as? String)!
        employeeDetailVC.linkedinprofile = (dataarr[indexPath.row].valueForKey("linkedinprofile") as? String)!
        self.navigationController?.pushViewController(employeeDetailVC, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarr.count
    }
    
    @IBAction func btn_logoutClick(sender: AnyObject) {
        PFUser.logOut()
        self.navigationController?.popToRootViewControllerAnimated(true)
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
