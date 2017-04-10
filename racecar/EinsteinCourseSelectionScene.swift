//
//  EinsteinCourseSelectionScene.swift
//  racecar
//
//  Created by Walters Mitch on 4/2/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation

import SpriteKit

class EinsteinCourseSelectionScene: SKScene {
    
    let easyButton = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    
    let course_two = SKLabelNode()
    let course_three = SKLabelNode()
    let course_four = SKLabelNode()
    
    
    override init() {
        super.init(size: CGSize(width: 750, height: 1334))
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = "Einstein Course #1"
        easyButton.fontSize = 100
        
        course_two.fontColor = SKColor.purple
        course_two.text = "Einstein Course #2"
        course_two.fontSize = 100
        
        course_three.fontColor = SKColor.purple
        course_three.text = "Einstein Course #3"
        course_three.fontSize = 100
        
        course_four.fontColor = SKColor.purple
        course_four.text = "Einstein Course #4"
        course_four.fontSize = 100
        
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "Back"
        hardButton.fontSize = 60
        
        
        
        easyButton.position = CGPoint(x: size.width / 2, y:  (2 * size.height) / 3)
        
        
        hardButton.position = CGPoint(x: size.width / 2, y: size.height / 4 - 125)
        course_two.position = CGPoint(x: size.width / 2, y: size.height / 2)
        course_three.position = CGPoint(x: size.width / 2, y: size.height / 3)
        course_four.position = CGPoint(x: size.width / 2, y: size.height / 4)
        
        addChild(easyButton)
        addChild(hardButton)
        addChild(course_two)
        addChild(course_three)
        addChild(course_four)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = EinsteinCourseOne()
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_two.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseTwo()
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_three.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseThree()
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_four.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = EinsteinCourseFour()
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
