//
//  ViewController.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 10/12/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    var alertController:UIAlertController? = nil
    var userWeightTextField: UITextField? = nil
    
    var imageList = [UIImage]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.workoutButton.layer.cornerRadius = 10.0
        self.calendarButton.layer.cornerRadius = 10.0
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
            print("Not first launch.")
        }
        else {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
        }
        
        for i in 1...4{
            let imageName = "Avatar\(i).jpg"
            imageList.append(UIImage(named: imageName)!)
        }
        startAnimation()
        
        //START- notification code
        let notification:UILocalNotification = UILocalNotification()
        
        //EM: hardcoded date until calendar is fixed
        // var workDate = blah
        //EM: catergories need to be fixed
        // notification.category = "FIRST_CATERGORY"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.alertBody = "Have you worked out today?"
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.repeatInterval = NSCalendarUnit.Day
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //END
    
    }
    
    @IBAction func userUpdateWeight(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Update Body Weight", message: "How much do you currently weight?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            print("You entered \(self.userWeightTextField!.text!)")
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfield customization code here.
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter your cuurent weight"
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    
    func startAnimation(){
        myImageView.animationImages = imageList
        myImageView.animationDuration = 2
        myImageView.startAnimating()
    }
}
