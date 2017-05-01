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
    
    
    let rule_one = SKLabelNode()
    let rule_two = SKLabelNode()
    let rule_three = SKLabelNode()
    
    
    let fontsize = CGFloat(50.0)
    
    let menuButton = SKLabelNode()
    
    
    let fontname = "Arcade"
    
    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        
        rule_one.fontColor = yellow
        rule_one.text = "Tap D-pad to change velocity"
        rule_one.fontSize = fontsize
        rule_one.fontName = fontname
        
        rule_two.fontColor = yellow
        rule_two.text = "Finish Cups quickly to unlock new courses"
        rule_two.fontSize = fontsize
        rule_two.fontName = fontname
        
        rule_three.fontColor = red
        rule_three.text = "Don't Crash"
        rule_three.fontSize = fontsize + 20
        rule_three.fontName = fontname
        
        
        
        menuButton.fontColor = blue
        menuButton.text = "Main Menu"
        menuButton.fontSize = fontsize + 30
        menuButton.fontName = fontname
        
        
        rule_one.position = CGPoint(x: 0, y: 250)
        //rule_two.position = CGPoint(x: 0, y: 50)
        rule_three.position = CGPoint(x: 0, y: 50)
        menuButton.position = CGPoint(x: 0, y: -350)
        
        addChild(rule_one)
        //addChild(rule_two)
        addChild(rule_three)
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
