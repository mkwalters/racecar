//
//  Tutorial.swift
//  racecar
//
//  Created by Walters Mitch on 4/9/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyStoreKit
import StoreKit

class Tutorial: SKScene {
    
    
    let rule_one = SKLabelNode()
    let rule_two = SKLabelNode()
    let rule_three = SKLabelNode()
    
    
    let fontsize = CGFloat(50.0)
    
    let menuButton = SKLabelNode()
    
    
    let restore_purchase = SKLabelNode()
    
    
    let fontname = "Arcade"
    
    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        
        rule_one.fontColor = yellow
        rule_one.text = "Tap D-pad to accelerate."
        rule_one.fontSize = fontsize
        rule_one.fontName = fontname
        
        rule_two.fontColor = yellow
        rule_two.text = "Manage velocity carefully"
        rule_two.fontSize = fontsize
        rule_two.fontName = fontname
        
        rule_three.fontColor = yellow
        rule_three.text = "to avoid crashing."
        rule_three.fontSize = fontsize
        rule_three.fontName = fontname
        
        
        
        menuButton.fontColor = blue
        menuButton.text = "Main Menu"
        menuButton.fontSize = fontsize + 30
        menuButton.fontName = fontname
        
        
        restore_purchase.fontColor = blue
        restore_purchase.text = "Restore Premium"
        restore_purchase.fontSize = fontsize + 30
        restore_purchase.fontName = fontname
        
        
        

        
        rule_one.position = CGPoint(x: 0, y: 300)
        rule_two.position = CGPoint(x: 0, y: 100)
        rule_three.position = CGPoint(x: 0, y: 50)
        menuButton.position = CGPoint(x: 0, y: -250)
        restore_purchase.position = CGPoint(x: 0, y: -400)
        
        addChild(rule_one)
        addChild(rule_two)
        addChild(rule_three)
        addChild(menuButton)
        addChild(restore_purchase)
        
        if let _ = UserDefaults.standard.value(forKey: "paid_version") {
            restore_purchase.removeFromParent()
            
            
        }
        
        
        
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
        
        if restore_purchase.contains(touchLocation){
            
            SwiftyStoreKit.restorePurchases(atomically: true) { results in
                if results.restoreFailedProducts.count > 0 {
                    print("Restore Failed: \(results.restoreFailedProducts)")
                }
                else if results.restoredProducts.count > 0 {
                    print("Restore Success: \(results.restoredProducts)")
                    UserDefaults.standard.set(true, forKey: "paid_version")
                    self.view?.subviews.forEach({ $0.removeFromSuperview() })
                }
                else {
                    print("Nothing to Restore")
                }
            }
            
        }
        
    }
    
    
}
