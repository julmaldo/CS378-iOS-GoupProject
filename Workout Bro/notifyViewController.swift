//
//  notifyViewController.swift
//  Workout Bro
//
//  Created by Emily Ngo on 11/28/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import EventKit

class notifyViewController: UIViewController {
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func save(sender: AnyObject) {
        //START- notification code
        
        //remove all the old ones first
        UIApplication.sharedApplication().cancelAllLocalNotifications()

        let notification:UILocalNotification = UILocalNotification()
        
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.alertBody = "Have you worked out today?"
        notification.timeZone = NSTimeZone.localTimeZone()
        //notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.fireDate = myDatePicker.date
        notification.repeatInterval = NSCalendarUnit.Day
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //END
    }
    
    @IBAction func exitPushed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

