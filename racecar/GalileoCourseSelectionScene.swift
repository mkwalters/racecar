//
//  GalileoCourseSelectionScene.swift
//  racecar
//
//  Created by Walters Mitch on 4/1/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation

import SpriteKit

class GalileoCourseSelectionScene: SKScene {
    
    let easyButton = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    
    
    override init() {
        super.init(size: CGSize(width: 750, height: 1334))
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = "Galileo Course #1"
        easyButton.fontSize = 80
        
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "Back"
        hardButton.fontSize = 60
        

        
        easyButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        hardButton.position = CGPoint(x: size.width / 2, y: size.height / 4)

        
        addChild(easyButton)
        addChild(hardButton)

        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyButton.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameScene = GalileoCourseOne()
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if hardButton.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
        
    }
    
    
}
