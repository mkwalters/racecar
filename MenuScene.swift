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
        
        backgroundColor = SKColor.white
        
        playButton.fontColor = SKColor.black
        playButton.text = "Grand Prix"
        
        playButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
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
