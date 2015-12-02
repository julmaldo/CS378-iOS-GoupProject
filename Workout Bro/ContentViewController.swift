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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAction(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        if self.users.count > 0{
            let user = self.users[0]
            let updatedXP = user.valueForKey("experience") as? String
            let xp = Int(updatedXP!)! + 1
            print(String(xp))
            user.setValue(String(xp), forKey: "experience")
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
