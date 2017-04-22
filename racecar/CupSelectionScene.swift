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
    
    
    
    var easyBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 370, height: 115)  )
    var hardBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 370, height: 115)  )
    var menuBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 370, height: 115)  )
    var backBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 250, height: 115)  )
    
    
    var game_type = String()
    
    init(size: CGSize, type: String) {
        super.init(size: size)
        
        game_type = type
        
        
        if game_type == "grand_prix" {
            
            easyBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 630, height: 115)  )
            hardBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 630, height: 115)  )
            menuBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 630, height: 115)  )
            backBackground = SKSpriteNode(color: UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0), size: CGSize(width: 250, height: 115)  )
            
        }
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = green
        
        //'s Cup
        
        
        easyBackground.position = CGPoint(x: 0, y: 180)
        easyBackground.zPosition = 4
        addChild(easyBackground)
        
        hardBackground.position = CGPoint(x: 0, y: 0)
        hardBackground.zPosition = 4
        addChild(hardBackground)
        
        menuBackground.position = CGPoint(x: 0, y: -180)
        menuBackground.zPosition = 4
        addChild(menuBackground)
        
        
        backBackground.position = CGPoint(x: 0, y: -400)
        backBackground.zPosition = 4
        addChild(backBackground)
        
        easyButton.fontColor = green
        easyButton.text = "Galileo"
        easyButton.fontSize = 100
        easyButton.fontName = "Arcade"
        easyButton.zPosition = 5
        
        hardButton.fontColor = green
        hardButton.text = "Newton"
        hardButton.fontSize = 100
        hardButton.fontName = "Arcade"
        hardButton.zPosition = 5
        
        menuButton.fontColor = green
        menuButton.text = "Einstein"
        menuButton.fontSize = 100
        menuButton.fontName = "Arcade"
        menuButton.zPosition = 5
        
        
        backButton.fontColor = green
        backButton.text = "Back"
        backButton.fontSize = 100
        backButton.fontName = "Arcade"
        backButton.zPosition = 5
        
        
        if game_type == "grand_prix" {
            
            easyButton.text = easyButton.text! + "'s Cup"
            hardButton.text = hardButton.text! + "'s Cup"
            menuButton.text = menuButton.text! + "'s Cup"
        }
        
        easyButton.position = CGPoint(x: 0, y: -50)
        hardButton.position = CGPoint(x: 0, y:  -50)
        menuButton.position = CGPoint(x: 0, y:  -50)
        backButton.position = CGPoint(x: 0, y:  -50)
        
        
        
        easyBackground.addChild(easyButton)
        hardBackground.addChild(hardButton)
        menuBackground.addChild(menuButton)
        backBackground.addChild(backButton)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if easyBackground.contains(touchLocation) {
            
            easyBackground.color = SKColor.white
            
        }
        
        if hardBackground.contains(touchLocation) {
            
            hardBackground.color = SKColor.white
            
        }
        
        if menuBackground.contains(touchLocation) {
            
            menuBackground.color = SKColor.white
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        easyBackground.color = purple
        hardBackground.color = purple
        menuBackground.color = purple
        backBackground.color = purple
        
        if easyBackground.contains(touchLocation) {
            
            
            
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
        
        if hardBackground.contains(touchLocation) {
            
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
        
        if menuBackground.contains(touchLocation){
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
    
        if backBackground.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = MenuScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
    
    
}
