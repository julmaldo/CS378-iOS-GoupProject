//
//  Workout.swift
//  Workout Bro
//
//  Created by Chad on 11/9/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit
import Foundation

class Workout{
    private var _exercise:String = ""
    private var _guide:UIImage
    private var _weight:String = ""
    
    init(exercise:String, guide:UIImage, weight:String){
        _exercise = exercise
        _guide = guide
        _weight = weight
    }
    
    func getExercise() -> String{
        return _exercise
    }
    
    func getGuide() -> UIImage{
        return _guide
    }
    
    func getWeight() -> String{
        return _weight
    }
}