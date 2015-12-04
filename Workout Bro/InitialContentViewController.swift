//
//  InitialContentViewController.swift
//  Workout Bro
//
//  Created by Chad on 11/6/15.
//  Copyright © 2015 JEC INC. All rights reserved.
//

import UIKit

class InitialContentViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController:UIPageViewController!
    var workoutExercises:[Workout] = [Workout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [ContentViewController], direction: .Forward, animated: true, completion: nil)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController{
        if (self.workoutExercises.count <= index){
            return ContentViewController()
        }
        
        let vc:ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
    
        vc.workoutIndex = self.workoutExercises[index].getExercise()
        vc.imageIndex = self.workoutExercises[index].getGuide()
        vc.weightIndex = self.workoutExercises[index].getWeight()
        vc.pageIndex = index
        if(index == (self.workoutExercises.count - 1)){
            vc.btnVis = true;
        }
        else{
            vc.btnVis = false;
        }
        
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if(index == 0 || index == NSNotFound){
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if(index == NSNotFound){
            return nil
        }
        
        index++
        if(index == self.workoutExercises.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return  self.workoutExercises.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
