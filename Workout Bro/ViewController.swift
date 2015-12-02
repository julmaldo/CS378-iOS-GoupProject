//
//  ViewController.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 10/12/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var goalWeightLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var broName: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    
    var users = [NSManagedObject]()
    var bros = [NSManagedObject]()

    var alertController:UIAlertController? = nil
    var userWeightTextField: UITextField? = nil
    
    var imageList = [UIImage]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.workoutButton.layer.cornerRadius = 10.0
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
       
        if firstLaunch  {
            print("Not first launch.")
        }
            
        else {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            self.performSegueWithIdentifier("setup", sender: nil)
        }
        
        //animations
        for i in 1...4{
            let imageName = "Avatar\(i).jpg"
            imageList.append(UIImage(named: imageName)!)
        }
        
        startAnimation()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        showUser()
        showBro()
    }
    
    func showBro(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName:"Bro")
        
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
            bros = results
        } else {
            print("Could not fetch")
        }
        if bros.count > 0{
            let bro = bros[0]
            broName.text = bro.valueForKey("name") as? String
            xpLabel.text = bro.valueForKey("experience") as? String
            levelLabel.text = bro.valueForKey("level") as? String
        }

    }
    
    func showUser() {
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
            currentWeightLabel.text = user.valueForKey("currentWeight") as? String
            goalWeightLabel.text = user.valueForKey("goalWeight") as? String
            userName.text = user.valueForKey("userName") as? String
        }
    }
    //alert to update weight, waiting for complete data model to update
    @IBAction func userUpdateWeight(sender: AnyObject) {
        
        self.alertController = UIAlertController(title: "Update Body Weight", message: "How much do you currently weight?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.updateCurrentWeight(self.userWeightTextField!.text!)
            //print("You entered \(self.userWeightTextField!.text!)")
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
    
    //EM: update current date from the alert
    func updateCurrentWeight(curr:String){
        var users = [NSManagedObject]()
        if(users.count > 0){
            let user = users[0]
            user.setValue(curr, forKey: "currentWeight")
            
        }
    }
    
    func startAnimation(){
        myImageView.animationImages = imageList
        myImageView.animationDuration = 2
        myImageView.startAnimating()
    }
}
