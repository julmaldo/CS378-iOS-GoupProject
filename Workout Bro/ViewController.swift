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
            let imageName = "Avatar\(i)"
            imageList.append(UIImage(named: imageName)!)
        }
        startAnimation()
    
    }
    
    func startAnimation(){
        myImageView.animationImages = imageList
        myImageView.animationDuration = 2
        myImageView.startAnimating()
    }
    
}
