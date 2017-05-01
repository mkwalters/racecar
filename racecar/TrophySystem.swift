//
//  TrophySystem.swift
//  racecar
//
//  Created by Walters Mitch on 4/19/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation


class TrophySystem {
    
    
    
    class func par_values() -> [String: Int] {
        return (
            
            [
                
            "GalileoCourseOne":   35,
            "GalileoCourseTwo":   35,
            "GalileoCourseThree": 40,
            "GalileoCourseFour":  45,
            
            "NewtonCourseOne":   80,
            "NewtonCourseTwo":   70,
            "NewtonCourseThree": 85,
            "NewtonCourseFour":  70,
            
            "EinsteinCourseOne":   100,
            "EinsteinCourseTwo":   135,
            "EinsteinCourseThree": 125,
            "EinsteinCourseFour":  200,
            
            ]
        
        )
    }
    
    
    class func cup_par_values() -> [String: Int] {
        return (
            
            [
                //make these reference course par values
                "Galileo":   200,
                "Newton":   330,
                "Einstein": 575

                
            ]
            
        )
    }
    
    
    class func gold(cup: String) -> Bool {
    
    
        if cup == "galileo" {
            
            return (UserDefaults.standard.value(forKey: "GalileoCourseFourGold") as? Bool)!
            
        } else if cup == "newton" {
            return (UserDefaults.standard.value(forKey: "NewtonCourseFourGold") as? Bool)!
            
        } else if cup == "einstein" {
            return (UserDefaults.standard.value(forKey: "EinsteinCourseFourGold") as? Bool)!
            
        }
        return(false)
    
    
    }
    
    
//    class func gold_trophies() ->  [String: Bool] {
//        
//        
//        let galileo_gold = UserDefaults.standard.value(forKey: "GalileoCourseFourGold") as? Bool
//        let newton_gold = UserDefaults.standard.value(forKey: "NewtonCourseFourGold") as? Bool
//        let einstein_gold = UserDefaults.standard.value(forKey: "EinsteinCourseFourGold") as? Bool
//        
//        return([
//            
//            
//            //make these reference course par values
//            "Galileo":   galileo_gold!,
//            "Newton":   newton_gold!,
//            "Einstein": einstein_gold!
//            
//            
//        ])
//        
//    }

}
