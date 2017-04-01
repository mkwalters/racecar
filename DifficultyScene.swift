//
//  DifficultyScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/30/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit

class DifficultyScene: SKScene {
    
    let easyButton = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        easyButton.fontColor = SKColor.black
        easyButton.text = "easy"
        
        hardButton.fontColor = SKColor.black
        hardButton.text = "hard"
        
        menuButton.fontColor = SKColor.black
        menuButton.text = "menu"
        
        easyButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        hardButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - easyButton.fontSize * 2)
        menuButton.position = CGPoint(x: size.width / 4 * 3, y: size.height / 4)
        
        addChild(easyButton)
        addChild(hardButton)
        addChild(menuButton)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameScene = EasyRaceScene(size: self.size, difficulty: easyButton.text!)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameScene = GameScene(size: self.size, difficulty: hardButton.text!)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if menuButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
