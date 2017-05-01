//
//  Tutorial.swift
//  racecar
//
//  Created by Walters Mitch on 4/9/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
class Tutorial: SKScene {
    
    
    let TimeTrials = SKLabelNode()
    let menuButton = SKLabelNode()
    
    let HowToPlay = SKLabelNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        
        TimeTrials.fontColor = SKColor.purple
        TimeTrials.text = "It's only physics! -Winston"
        TimeTrials.fontSize = 65
        
        menuButton.fontColor = SKColor.purple
        menuButton.text = "Main Menu"
        menuButton.fontSize = 40
        
        TimeTrials.position = CGPoint(x: 0, y: 0)
        menuButton.position = CGPoint(x: 0, y: -200)
        
        addChild(TimeTrials)
        addChild(menuButton)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        

        
        if menuButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
