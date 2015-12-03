//
//  SetupViewController.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 12/1/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData

class SetupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //EM: notify user monthly to update weight 
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        
        let pageController = UIPageControl.appearance()
        pageController.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageController.currentPageIndicatorTintColor = UIColor.blackColor()
        pageController.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //makes the keyboard disapear when clicking on something outside the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent:event)
    }
    
    //dismisses keyboard when return is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var startingWeightTF: UITextField!
    @IBOutlet weak var goalWeightTF: UITextField!
    @IBOutlet weak var broNameTF: UITextField!

    @IBAction func startPushed(sender: AnyObject) {
        let currentWeightTF = startingWeightTF.text!
        saveUser(currentWeightTF, goalWeight: goalWeightTF.text!, startingWeight: startingWeightTF.text!, userName:usernameTF.text! )
        saveBro(broNameTF.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveUser(currentWeight: String, goalWeight: String, startingWeight:String,userName:String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        user.setValue(currentWeight, forKey: "currentWeight")
        user.setValue(goalWeight, forKey: "goalWeight")
        user.setValue(startingWeight, forKey: "startWeight")
        user.setValue(userName, forKey: "userName")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
    }
    func saveBro(broName: String) {
        let level = "1"
        let experience = "0"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("Bro", inManagedObjectContext: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        user.setValue(broName, forKey: "name")
        user.setValue(level, forKey: "level")
        user.setValue(experience, forKey: "experience")
        
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
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
