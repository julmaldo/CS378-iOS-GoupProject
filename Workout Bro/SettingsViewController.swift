//
//  SettingsViewController.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 11/6/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var user = [NSManagedObject]()
    @IBOutlet weak var startingWeightTF: UITextField!
    @IBOutlet weak var currentWeightTF: UITextField!
    @IBOutlet weak var goalWeightTF: UITextField!
  
    func saveUser(currentWeight: String, goalWeight: String, startingWeight:String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        user.setValue(currentWeight, forKey: "currentWeight")
        user.setValue(goalWeight, forKey: "goalWeight")
        user.setValue(startingWeight, forKey: "startWeight")
        
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

    @IBAction func Exit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func DonePushed(sender: AnyObject) {
        saveUser(currentWeightTF.text!, goalWeight: goalWeightTF.text!, startingWeight: startingWeightTF.text!)
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
