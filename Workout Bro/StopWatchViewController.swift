//
//  StopWatchViewController.swift
//  Workout Bro
//
//  Created by Emily Ngo on 10/15/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var displayTimeLabel: UILabel!
    @IBOutlet weak var userTime: UIPickerView!
    
    var arrPicks:[Int] = []
    
    var timeRemain = 0
    var timer:NSTimer? = nil
    var isRun = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...40{
            arrPicks.append(i*5)
        }
    }
    
    @IBAction func start(sender: AnyObject) {
        if(isRun == false){
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
            isRun = true
        }
    }
    
    @IBAction func stop(sender: AnyObject) {
        if(isRun == true){
            timer!.invalidate()
            isRun = false
        }
    }
    
    func updateTime() {
        --timeRemain
        if(timeRemain > 0){
            displayTimeLabel.text = String(timeRemain)
        }
        else{
            displayTimeLabel.text = "Done!"
            timer!.invalidate()
            timer = nil
            isRun = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPicks.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(isRun == false){
            timeRemain = arrPicks[row]
            displayTimeLabel.text = String(arrPicks[row])
        }
        return "\(arrPicks[row])"
    }
    
    @IBAction func exit(sender: AnyObject) {
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
