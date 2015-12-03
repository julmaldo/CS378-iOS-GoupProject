//
//  ContentViewController.swift
//  Workout Bro
//
//  Created by Chad on 11/6/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import CoreData
class ContentViewController: UIViewController {
    
    @IBOutlet weak var recWeight: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var recLbl: UILabel!
    
    var users = [NSManagedObject]()
    
    var workoutIndex: String!
    var imageIndex: UIImage!
    var weightIndex: String!
    var pageIndex: Int!
    var btnVis: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.workoutName.text = self.workoutIndex
        self.workoutImage.image = self.imageIndex
        self.recWeight.text = self.weightIndex
        if(!btnVis){
            btnFinish.hidden = true;
        }
        workoutCheck()
        showUser()
    }
    
    func showUser(){
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
            users = results
        } else {
            print("Could not fetch")
        }
    
    }
    
    func workoutCheck(){
        if (self.workoutIndex == "Squats" || self.workoutIndex == "Crunches" || self.workoutIndex == "Sit-ups"){
            recLbl.text = "Recommended Start Reps:"
        }
        else if (self.workoutIndex == "Planks"){
            recLbl.text = "Recommended Start Duration:"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAction(sender: AnyObject) {
        let myDate = NSUserDefaults.standardUserDefaults().objectForKey("myDate") as? NSDate
        
        if let lastPushed = myDate {
            let dateNow = NSDate()
            let secondsInDay:NSTimeInterval = 30
            print(dateNow.timeIntervalSinceDate(lastPushed))
            
            if dateNow.timeIntervalSinceDate(lastPushed) >= secondsInDay{
                NSUserDefaults.standardUserDefaults().setObject(dateNow, forKey: "myDate")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                addXP()
            }
        }
        else{
            let currentDate = NSDate()
            
            NSUserDefaults.standardUserDefaults().setObject(currentDate, forKey: "myDate")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            addXP()
        }
    }

    func addXP(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        if self.users.count > 0{
            let user = self.users[0]
            let xp = user.valueForKey("experience") as? String
            let updatedXP = Int(xp!)! + 1
            print(String(updatedXP))
            user.setValue(String(updatedXP), forKey: "experience")
        }
        
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
