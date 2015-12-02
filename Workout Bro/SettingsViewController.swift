//
//  SettingsViewController.swift
//  Workout Bro
//
//  Created by Emily Ngo on 12/1/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    var users = [NSManagedObject]()
    
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var sWeight: UILabel!
    @IBOutlet weak var cWeight: UILabel!
    @IBOutlet weak var gWeight: UILabel!
    
    var alertController:UIAlertController? = nil
    var userWeightTextField: UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showUser()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showUser(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName:"User")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            users = results
        } else {
            print("Could not fetch")
        }
        if users.count > 0{
            let user = users[0]
            cWeight.text = user.valueForKey("currentWeight") as? String
            gWeight.text = user.valueForKey("goalWeight") as? String
            sWeight.text = user.valueForKey("startWeight") as? String
            uName.text = user.valueForKey("userName") as? String
        }
    }
    
    @IBAction func updateName(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Update Username", message: "What do you want your username to be?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            if self.users.count > 0{
                let user = self.users[0]
                user.setValue(self.userWeightTextField!.text!, forKey: "userName")
            }
            
            // Commit the changes.
            do {
                try managedContext.save()
            } catch {
                // what to do if an error occurs?
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
            self.showUser()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter a name."
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    
    @IBAction func updateStart(sender: AnyObject) {
        
        self.alertController = UIAlertController(title: "Update Starting Weight", message: "What was your starting weight?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            if self.users.count > 0{
                let user = self.users[0]
                user.setValue(self.userWeightTextField!.text!, forKey: "startWeight")
            }
            
            // Commit the changes.
            do {
                try managedContext.save()
            } catch {
                // what to do if an error occurs?
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
            self.showUser()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter your current weight"
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }

    
    @IBAction func updateCurrent(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Update Current Weight", message: "How much do you currently weight?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            if self.users.count > 0{
                let user = self.users[0]
                user.setValue(self.userWeightTextField!.text!, forKey: "currentWeight")
            }
            
            // Commit the changes.
            do {
                try managedContext.save()
            } catch {
                // what to do if an error occurs?
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
            self.showUser()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter your current weight."
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    
    @IBAction func updateGoal(sender: AnyObject) {
        self.alertController = UIAlertController(title: "Update Goal Weight", message: "How much do you want to weigh?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            if self.users.count > 0{
                let user = self.users[0]
                user.setValue(self.userWeightTextField!.text!, forKey: "goalWeight")
            }
            
            // Commit the changes.
            do {
                try managedContext.save()
            } catch {
                // what to do if an error occurs?
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
            self.showUser()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter a goal weight."
        }
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    
    @IBAction func exitView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
