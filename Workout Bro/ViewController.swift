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
    
    func startAnimation(){
        myImageView.animationImages = imageList
        myImageView.animationDuration = 2
        myImageView.startAnimating()
    }
    
}
