//
//  MenuScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/30/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.

//


import SpriteKit
class MenuScene: SKScene {
    
    let playButton = SKLabelNode()
    
    
    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        playButton.fontColor = SKColor.purple
        playButton.text = "Grand Prix"
        playButton.fontSize = 100
        
        playButton.position = CGPoint(x: 0, y: 0)
        
        addChild(playButton)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if playButton.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let difficultyScene = DifficultyScene(size: self.size)
            self.view?.presentScene(difficultyScene, transition: reveal)
            
        }
        
    }
    
    
}
