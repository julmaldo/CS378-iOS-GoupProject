//
//  set counter.swift
//  Workout Bro
//
//  Created by Julio Maldonado on 11/5/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class set_counter: UIViewController {
    
    //Counter outlets

    @IBOutlet weak var counterTotalLabel: UILabel!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var currSet: UIButton!
    var idx = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        counterTotalLabel.text = String(counterView.counterTotal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitPushed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func redoSetPushed(sender: AnyObject) {
        if counterView.counter > 0 {
            counterView.counter--
            idx--
            currSet.setTitle("Do Set " + idx.description, forState: .Normal)
        }
        counterLabel.text = String(counterView.counter)
    }
    @IBAction func finishedSetPushed(sender: UIButton) {
        if counterView.counter < counterView.counterTotal {
            counterView.counter++
            idx++
        }
        else{
            dismissViewControllerAnimated(true, completion: nil)
        }
        counterLabel.text = String(counterView.counter)
        if(idx != 4){
            currSet.setTitle("Do Set " + idx.description, forState: .Normal)
        }
        else{
            currSet.setTitle("Done & Exit", forState: .Normal)
        }
        
    }
    @IBAction func startOverPushed(sender: AnyObject) {
        while (counterView.counter > 0){
            counterView.counter--
        }
        counterLabel.text = String(counterView.counter)
    }
}

