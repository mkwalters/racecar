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
    
    
    var game_type = String()
    
    init(size: CGSize, type: String) {
        super.init(size: size)
        
        game_type = type
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = green
        
        easyButton.fontColor = purple
        easyButton.text = "Galileo's Cup"
        easyButton.fontSize = 100
        easyButton.fontName = "Arcade"
        
        hardButton.fontColor = purple
        hardButton.text = "Newton's Cup"
        hardButton.fontSize = 100
        hardButton.fontName = "Arcade"
        
        menuButton.fontColor = purple
        menuButton.text = "Einstein's Cup"
        menuButton.fontSize = 100
        menuButton.fontName = "Arcade"
        
        backButton.fontColor = purple
        backButton.text = "Back"
        backButton.fontSize = 100
        backButton.fontName = "Arcade"
        
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
            
            if self.game_type == "time_trials" {
                let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                let gameScene = GalileoCourseSelectionScene(name: "Galileo", type: game_type)
                self.view?.presentScene(gameScene, transition: reveal)
            } else {
                let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                let gameScene = GalileoCourseOne(type: "grand_prix", previous_move_count: 0, number_of_lives: 3)
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
        
        if hardButton.contains(touchLocation) {
            
            if self.game_type == "time_trials" {
                let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                let gameScene = NewtonCourseSelectionScene(name: "Newton", type: game_type)
                self.view?.presentScene(gameScene, transition: reveal)
            } else {
                let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                let gameScene = NewtonCourseOne(type: "grand_prix", previous_move_count: 0, number_of_lives: 3)
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
        
        if menuButton.contains(touchLocation){
            if self.game_type == "time_trials" {
                let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                let menuScene = EinsteinCourseSelectionScene(name: "Einstein", type: game_type)
                self.view?.presentScene(menuScene, transition: reveal)
            } else {
                let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                let gameScene = EinsteinCourseOne(type: "grand_prix", previous_move_count: 0, number_of_lives: 3)
                self.view?.presentScene(gameScene, transition: reveal)
            }
        }
    
        if backButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = MenuScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
    
    
}
