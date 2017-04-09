//
//  MenuScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/30/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.

//


import SpriteKit
class MenuScene: SKScene {
    
    let GrandPrix = SKLabelNode()
    let TimeTrials = SKLabelNode()
    
    let HowToPlay = SKLabelNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        GrandPrix.fontColor = SKColor.purple
        GrandPrix.text = "Grand Prix"
        GrandPrix.fontSize = 100
        
        GrandPrix.position = CGPoint(x: 0, y: 150)
        
        addChild(GrandPrix)
        
        
        TimeTrials.fontColor = SKColor.purple
        TimeTrials.text = "Time Trials"
        TimeTrials.fontSize = 100
        
        TimeTrials.position = CGPoint(x: 0, y: 0)
        
        addChild(TimeTrials)
        
        HowToPlay.fontColor = SKColor.purple
        HowToPlay.text = "Help"
        HowToPlay.fontSize = 100
        
        HowToPlay.position = CGPoint(x: 0, y: -150)
        
        addChild(HowToPlay)
        
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if GrandPrix.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let difficultyScene = DifficultyScene(size: self.size)
            self.view?.presentScene(difficultyScene, transition: reveal)
            
        }
        
    }
    
    
}
