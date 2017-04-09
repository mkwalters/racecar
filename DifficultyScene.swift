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
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        backgroundColor = SKColor.black
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = "50 CC"
        easyButton.fontSize = 70
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "100 C"
        hardButton.fontSize = 70
        
        menuButton.fontColor = SKColor.purple
        menuButton.text = "Main Menu"
        menuButton.fontSize = 45
        
        easyButton.position = CGPoint(x: 0, y: 200)
        hardButton.position = CGPoint(x: 0, y: 0)
        menuButton.position = CGPoint(x: 0, y: -200)
        
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
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if menuButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
