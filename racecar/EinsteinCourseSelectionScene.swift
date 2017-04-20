//
//  EinsteinCourseSelectionScene.swift
//  racecar
//
//  Created by Walters Mitch on 4/2/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation

import SpriteKit

class EinsteinCourseSelectionScene: CourseSelectionScene {
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = EinsteinCourseOne(type: "time_trials", previous_move_count: 0, number_of_lives: 0)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_two.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseTwo(type: "time_trials", previous_move_count: 0, number_of_lives: 0)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_three.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseThree(type: "time_trials", previous_move_count: 0, number_of_lives: 0)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_four.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseFour(type: "time_trials", previous_move_count: 0, number_of_lives: 0)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
