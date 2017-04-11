//
//  CupSelection.swift
//  racecar
//
//  Created by Walters Mitch on 4/1/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import Foundation
import SpriteKit

class CupSelectionScene: SKScene {
    
    let easyButton = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    let backButton = SKLabelNode()
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = "Galileo's Cup"
        easyButton.fontSize = 100
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "Newton's Cup"
        hardButton.fontSize = 100
        
        menuButton.fontColor = SKColor.purple
        menuButton.text = "Einstein's Cup"
        menuButton.fontSize = 100
        
        backButton.fontColor = SKColor.purple
        backButton.text = "Back"
        backButton.fontSize = 100
        
        easyButton.position = CGPoint(x: 0, y: 300)
        hardButton.position = CGPoint(x: 0, y:  150)
        menuButton.position = CGPoint(x: 0, y:  0)
        backButton.position = CGPoint(x: 0, y:  -400)
        
        addChild(easyButton)
        addChild(hardButton)
        addChild(menuButton)
        addChild(backButton)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let gameScene = GalileoCourseSelectionScene(name: "Galileo")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let gameScene = NewtonCourseSelectionScene(name: "Newton")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if menuButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = EinsteinCourseSelectionScene(name: "Einstein")
            self.view?.presentScene(menuScene, transition: reveal)
        }
    
        if backButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = DifficultyScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
    
    
}
