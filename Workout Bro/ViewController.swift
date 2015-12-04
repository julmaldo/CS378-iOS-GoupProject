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

    //Variables
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var goalWeightLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var broName: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var lastLevel:Int = 1
    var startingWeight:String = ""
    
    // Arrays for Users and Bros
    var users = [NSManagedObject]()
    var bros = [NSManagedObject]()
    //array for images to be animated
    var imageList = [UIImage]()
    var alertController:UIAlertController? = nil
    var userWeightTextField: UITextField? = nil
    //outlets for progress bars
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var weightProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        //checking it is the first time the app is launching
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch {
            print("Not first launch.")
        }
        else {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            self.performSegueWithIdentifier("setup", sender: nil)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        //makes progress bars bigger
        progressView.transform = CGAffineTransformMakeScale(1.0, 5.0)
        weightProgressBar.transform = CGAffineTransformMakeScale(1.0, 5.0)
        //updating ui variables
        showUser()
        showBro()
        increaseXp()
        updateWeightProgress()
        
        //displays the level of status
        let xp = Int(xpLabel.text!)!
        var level:Int
        var status:String
        if xp < 3 {
            level = 1
            status = "Newbie"
        }else
            if xp < 9{
                level = 2
                status = "Gym Rat"
            }else{
                status = "Gym Master"
                level = 3
            }
        //checks if bro has increases a level, then clears array of images to be animated
        if lastLevel != level{
            congrats(status)
            imageList.removeAll()
            updateLevel(level)
        }
        statusLabel.text = status
        for i in 1...2{
            let imageName = "Avatar\(level)\(i).jpg"
            imageList.append(UIImage(named: imageName)!)
        }
        
        startAnimation()
    }
    
    //JM: displays alertcontroller to congradulate user on completing their goal and asks them to input
    //new level
    func congrats(status:String){
        self.alertController = UIAlertController(title: "XP Gained!", message: "Congratulations! You evolved into a  \(status)!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        
        presentViewController(self.alertController!, animated: true, completion: nil)
    }
    
    //JM: updates the  goal weight progression progress bar
    func updateWeightProgress(){
        var start = float_t(startingWeight)
        var current = float_t(currentWeightLabel.text!)
        var goal = float_t(goalWeightLabel.text!)
        if start == nil{
            start = 0
        }
        if current == nil{
            current = 0
        }
        if goal == nil{
            goal = 0
        }
        let percent = (start! - current!)/(start! - goal!)
        if (percent) >= 1.0{
            userUpdateGoal()
        }
        weightProgressBar?.progress = percent
    }
    
    //JM: updates the level progress for bro
    func updateProgress(counter:float_t,let level:Int){
        let dom:float_t
        if level == 1{
            dom = 3.0
        }else if
            level == 2{
                dom = 6.0
        }else{
                dom = 9.0
        }
        progressView?.progress = counter/dom
    }

    //JM: updates the bros level in core data
    func updateLevel(level:Int) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
    
        if self.bros.count > 0{
            let user = self.bros[0]
            user.setValue(String(level), forKey: "level")
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
    }
    
    //JM: calculates the corespoding level and progress to the next using experience points
    func increaseXp(){
        let xp = Int(xpLabel.text!)!
        //decides which level bro is
        var level:Int
        if xp < 3 {
            level = 1
        }else
            if xp < 9{
            level = 2
        }else
            {
            level = 3
        }
        var counter:Int
        if xp <= 2{
            counter = xp
        } else if xp <= 8{
            counter = xp - ((level - 1) * 3)
        }else{
            counter = xp - (level * 3)
        }
        if xp >= 18{
            counter = 9
        }
        updateProgress(float_t(counter), level: level)
        levelLabel.text = String(level)
    }
    
    //JM: updates the variables about bro
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
            lastLevel = Int((bro.valueForKey("level") as? String)!)!

        }
    }
    
    //JM:updates the variables for user
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
            startingWeight = user.valueForKey("startWeight") as! String!
        }
    }
    
    //JM: alert to update weight after user has reached goal weight
    func userUpdateGoal() {
        self.alertController = UIAlertController(title: "Update Goal Weight", message: "Fantastic! You made your goal! What would you like your new goal to be?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "Update Goal", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            if self.users.count > 0{
                let user = self.users[0]
                user.setValue(self.userWeightTextField!.text!, forKey: "goalWeight")
                user.setValue(self.currentWeightLabel.text!, forKey: "startWeight")
                user.setValue(self.currentWeightLabel.text!, forKey: "currentWeight")
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
            self.updateWeightProgress()
        })
        
        let cancel = UIAlertAction(title: "Keep Goal", style: UIAlertActionStyle.Cancel) { (action) -> Void in
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.userWeightTextField = textField
            self.userWeightTextField?.placeholder = "Enter a goal weight."
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
        print("NUM IMAGES: \(myImageView.animationImages?.count)")
    }
}
