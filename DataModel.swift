//
//  DataModel.swift
//  Workout Bro
//
//  Created by Chad on 10/22/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    private var workoutList:[String] = [String]()
    
    init(){
        workoutList.append("Arms")
        workoutList.append("Chest")
        workoutList.append("Shoulders")
        workoutList.append("Back")
        workoutList.append("Legs")
        workoutList.append("Abs")
    }
    
    func count() -> Int{
        return workoutList.count
    }
    
    func getWorkout(index:Int) -> String{
        if index < workoutList.count{
            return workoutList[index]
        }
        else{
            return "N/A workout"
        }
    }
}