//
//  SettingsViewController.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 11/6/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var alertController:UIAlertController? = nil
    var loginTextField: UITextField? = nil
    
    @IBAction func goalAdjustPushed(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Alert Controller", message: "Alert Controller With Text Field", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            print("Ok Button Pressed 2")
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            print("Cancel Button Pressed 2")
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfield customization code here.
            self.loginTextField = textField
            self.loginTextField?.placeholder = "Enter Weight"
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    @IBAction func currentAdjustPushed(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Alert Controller", message: "Alert Controller With Text Field", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            print("Ok Button Pressed 2")
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            print("Cancel Button Pressed 2")
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfield customization code here.
            self.loginTextField = textField
            self.loginTextField?.placeholder = "Enter Weight"
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    @IBAction func startingAdjustPushed(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Alert Controller", message: "Alert Controller With Text Field", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            print("Ok Button Pressed 2")
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            print("Cancel Button Pressed 2")
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfield customization code here.
            self.loginTextField = textField
            self.loginTextField?.placeholder = "Enter Weight"
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
   


    @IBAction func DonePushed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
