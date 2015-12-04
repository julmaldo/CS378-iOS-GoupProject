//
//  WorkoutTableViewController.swift
//  Workout Bro
//
//  Created by Chad on 10/22/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {

    var data:DataModel = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count()
    }
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor(red:0.68, green:0.26, blue:0.09, alpha:1.0)
        cell?.backgroundColor = UIColor(red:0.68, green:0.26, blue:0.09, alpha:1.0)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("workout", forIndexPath: indexPath)
        
        // Configure the cell...
        let index:Int = indexPath.row
        let workout:String = self.data.getWorkout(index)
        cell.textLabel!.text = workout
        
        return cell
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath:NSIndexPath? = self.tableView!.indexPathForSelectedRow!
        
        let vc:InitialContentViewController = segue.destinationViewController as! InitialContentViewController
        
        vc.workoutExercises = self.data.getExercises(indexPath!.row)
   }



}
