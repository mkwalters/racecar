//
//  NewtonCourseSelection.swift
//  racecar
//
//  Created by Walters Mitch on 4/1/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import Foundation
import Foundation
import SpriteKit

class NewtonCourseSelectionScene: SKScene {
    
    let easyButton = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    let course_two = SKLabelNode()
    
    
    override init() {
        super.init(size: CGSize(width: 750, height: 1334))
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = "Newton Course #1"
        easyButton.fontSize = 100
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "Back"
        hardButton.fontSize = 60
        
        course_two.fontColor = SKColor.purple
        course_two.text = "Newton Course #2"
        course_two.fontSize = 100
        
        
        
        easyButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        hardButton.position = CGPoint(x: size.width / 2, y: size.height / 4)
        course_two.position = CGPoint(x: size.width / 2, y: size.height / 3)
        
        addChild(easyButton)
        addChild(hardButton)
        addChild(course_two)
        
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = NewtonCourseOne()
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
        if course_two.contains(touchLocation){
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let menuScene = NewtonCourseTwo()
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
    
    
}
