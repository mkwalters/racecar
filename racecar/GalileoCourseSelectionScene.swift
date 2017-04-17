//
//  GalileoCourseSelectionScene.swift
//  racecar
//
//  Created by Walters Mitch on 4/1/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation

import SpriteKit

class GalileoCourseSelectionScene: CourseSelectionScene {
    
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        
        //
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = GalileoCourseOne(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        //CGSize(width: 750, height: 1334)
        if hardButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_two.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = GalileoCourseTwo(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_three.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = GalileoCourseThree(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_four.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = GalileoCourseFour(size: CGSize(width: 750, height: 1334), type: self.game_type)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
