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
                
            "GalileoCourseOne":   40,
            "GalileoCourseTwo":   40,
            "GalileoCourseThree": 60,
            "GalileoCourseFour":  80,
            
            "NewtonCourseOne":   90,
            "NewtonCourseTwo":   100,
            "NewtonCourseThree": 110,
            "NewtonCourseFour":  120,
            
            "EinsteinCourseOne":   120,
            "EinsteinCourseTwo":   130,
            "EinsteinCourseThree": 140,
            "EinsteinCourseFour":  150,
            
            ]
        
        )
    }
    
    
    class func cup_par_values() -> [String: Int] {
        return (
            
            [
                //make these reference course par values
                "Galileo":   250,
                "Newton":   600,
                "Einstein": 800

                
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
