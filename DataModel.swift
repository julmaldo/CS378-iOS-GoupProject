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
    private var workoutExercises = Array(count: 6, repeatedValue: [Workout]())
    
    init(){
        
        //pre-made workouts to put in Table View
        workoutList.append("Arms")
        workoutList.append("Chest")
        workoutList.append("Shoulders")
        workoutList.append("Back")
        workoutList.append("Legs")
        workoutList.append("Abs")
        
        workoutExercises[0].append(Workout(exercise: "Curls", guide: UIImage(named: "Curls")!, weight: "10 lbs"))
        workoutExercises[0].append(Workout(exercise: "Tricep Press", guide: UIImage(named: "Tricep Press")!, weight: "10 lbs"))
        workoutExercises[0].append(Workout(exercise: "Reverse Curls", guide: UIImage(named: "Reverse Curls")!, weight: "10 lbs"))
        
        workoutExercises[1].append(Workout(exercise: "Chest Press", guide: UIImage(named: "Chest Press")!, weight: "15 lbs"))
        workoutExercises[1].append(Workout(exercise: "Chest Fly", guide: UIImage(named: "Chest Fly")!, weight: "10 lbs"))
        workoutExercises[1].append(Workout(exercise: "Incline Chest Press", guide: UIImage(named: "Incline Chest Press")!, weight: "15 lbs"))
        
        workoutExercises[2].append(Workout(exercise: "Shoulder Press", guide: UIImage(named: "Shoulder Press")!, weight: "10 lbs"))
        workoutExercises[2].append(Workout(exercise: "Lateral Raise", guide: UIImage(named: "Lateral Raise")!, weight: "10 lbs"))
        workoutExercises[2].append(Workout(exercise: "Front Raise", guide: UIImage(named: "Front Raise")!, weight: "10 lbs"))
        
        workoutExercises[3].append(Workout(exercise: "Dumbbell Row", guide: UIImage(named: "Dumbbell Row")!, weight: "10 lbs"))
        workoutExercises[3].append(Workout(exercise: "Dumbbell Shrug", guide: UIImage(named: "Dumbbell Shrug")!, weight: "10 lbs"))
        workoutExercises[3].append(Workout(exercise: "Dumbbell Deadlift", guide: UIImage(named: "Deadlift")!, weight: "10 lbs"))
        
        workoutExercises[4].append(Workout(exercise: "Squats", guide: UIImage(named: "Squats")!, weight: "10 reps"))
        workoutExercises[4].append(Workout(exercise: "Lunges", guide: UIImage(named: "Lunges")!, weight: "10 lbs"))
        workoutExercises[4].append(Workout(exercise: "Calf Raises", guide: UIImage(named: "Calf Raises")!, weight: "10 lbs"))
        
        workoutExercises[5].append(Workout(exercise: "Planks", guide: UIImage(named: "Planks")!, weight: "60 seconds"))
        workoutExercises[5].append(Workout(exercise: "Crunches", guide: UIImage(named: "Crunches")!, weight: "10 reps"))
        workoutExercises[5].append(Workout(exercise: "Sit-ups", guide: UIImage(named: "Sit Ups")!, weight: "10 reps"))
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
    
    func getExercises(index:Int) -> [Workout]{
        return workoutExercises[index]
    }
}