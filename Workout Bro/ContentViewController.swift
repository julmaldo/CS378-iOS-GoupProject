//
//  ContentViewController.swift
//  Workout Bro
//
//  Created by Zach on 11/6/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var recWeight: UILabel!
    
    var workoutIndex: String!
    var imageIndex: UIImage!
    var weightIndex: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.workoutName.text = self.workoutIndex
        self.workoutImage.image = self.imageIndex
        self.recWeight.text = self.weightIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
