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
    
    
    let title_first_word = SKLabelNode()
    let title_second_word = SKLabelNode()
    
    
    var easyBackground = SKSpriteNode(color: blue, size: CGSize(width: 370, height: 115)  )
    var hardBackground = SKSpriteNode(color: blue, size: CGSize(width: 370, height: 115)  )
    var menuBackground = SKSpriteNode(color: blue, size: CGSize(width: 370, height: 115)  )
    var backBackground = SKSpriteNode(color: blue, size: CGSize(width: 250, height: 115)  )
    
    
    var game_type = String()
    
    init(size: CGSize, type: String) {
        super.init(size: size)
        
        game_type = type
        
        
        title_first_word.text = "Time"
        title_first_word.fontSize = 100
        title_first_word.fontColor = yellow
        title_first_word.position = CGPoint(x: 0, y: 450)
        title_first_word.fontName = "FasterOne-Regular"
        
        
        title_second_word.text = "Trials"
        title_second_word.fontSize = 100
        title_second_word.fontColor = yellow
        title_second_word.position = CGPoint(x: 0, y: 350)
        title_second_word.fontName = "FasterOne-Regular"
        
        addChild(title_first_word)
        addChild(title_second_word)
        
        if game_type == "grand_prix" {
            
            title_first_word.text = "Grand"
            title_second_word.text = "Prix"
            
            
            let galileo_gold_medal_background = SKSpriteNode(color: blue, size: CGSize(width: 115, height: 115))
            galileo_gold_medal_background.position = CGPoint(x: 240, y: 180)
            galileo_gold_medal_background.scale(to: CGSize(width: 115, height: 115))
            galileo_gold_medal_background.zPosition = 4
            
            let newton_gold_medal_background = SKSpriteNode(color: blue, size: CGSize(width: 115, height: 115))
            newton_gold_medal_background.position = CGPoint(x: 240, y: 0)
            newton_gold_medal_background.scale(to: CGSize(width: 115, height: 115))
            newton_gold_medal_background.zPosition = 4
            
            let einstein_gold_medal_background = SKSpriteNode(color: blue, size: CGSize(width: 115, height: 115))
            einstein_gold_medal_background.position = CGPoint(x: 240, y: -180)
            einstein_gold_medal_background.scale(to: CGSize(width: 115, height: 115))
            einstein_gold_medal_background.zPosition = 4
            
            
            addChild(galileo_gold_medal_background)
            addChild(newton_gold_medal_background)
            addChild(einstein_gold_medal_background)
            ///
            var galileo_gold_medal = SKSpriteNode(imageNamed: "gold_medal_outline")

            if let _ = UserDefaults.standard.value(forKey: "GalileoCourseFourGold") {
                
                galileo_gold_medal = SKSpriteNode(imageNamed: "gold_medal")
            }
            ////
            
            var newton_gold_medal = SKSpriteNode(imageNamed: "gold_medal_outline")
            
            if let _ = UserDefaults.standard.value(forKey: "NewtonCourseFourGold") {
                
                newton_gold_medal = SKSpriteNode(imageNamed: "gold_medal")
            }
            ////
            var einstein_gold_medal = SKSpriteNode(imageNamed: "gold_medal_outline")
            
            if let _ = UserDefaults.standard.value(forKey: "EinsteinCourseFourGold") {
                
                einstein_gold_medal = SKSpriteNode(imageNamed: "gold_medal")
            }
            
            
            galileo_gold_medal.position = CGPoint(x: 240, y: 180)
            galileo_gold_medal.scale(to: CGSize(width: 115, height: 115))
            galileo_gold_medal.zPosition = 5
            
            newton_gold_medal.position = CGPoint(x: 240, y: 0)
            newton_gold_medal.scale(to: CGSize(width: 115, height: 115))
            newton_gold_medal.zPosition = 5
            
            einstein_gold_medal.position = CGPoint(x: 240, y: -180)
            einstein_gold_medal.scale(to: CGSize(width: 115, height: 115))
            einstein_gold_medal.zPosition = 5
            
            
            addChild(galileo_gold_medal)
            addChild(newton_gold_medal)
            addChild(einstein_gold_medal)
            
            
            easyBackground = SKSpriteNode(color: blue, size: CGSize(width: 430, height: 115)  )
            hardBackground = SKSpriteNode(color: blue, size: CGSize(width: 430, height: 115)  )
            menuBackground = SKSpriteNode(color: blue, size: CGSize(width: 430, height: 115)  )
            backBackground = SKSpriteNode(color: blue, size: CGSize(width: 250, height: 115)  )
            
            
        }
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
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
        
        easyButton.fontColor = yellow
        easyButton.text = "Galileo"
        easyButton.fontSize = 43
        easyButton.fontName = "PressStart2P"
        easyButton.zPosition = 5
        
        hardButton.fontColor = yellow
        hardButton.text = "Newton"
        hardButton.fontSize = 43
        hardButton.fontName = "PressStart2P"
        hardButton.zPosition = 5
        
        menuButton.fontColor = yellow
        menuButton.text = "Einstein"
        menuButton.fontSize = 43
        menuButton.fontName = "PressStart2P"
        menuButton.zPosition = 5
        
        
        backButton.fontColor = yellow
        backButton.text = "Back"
        backButton.fontSize = 43
        backButton.fontName = "PressStart2P"
        backButton.zPosition = 5
        
        
        if game_type == "grand_prix" {
            
            easyButton.fontSize = 30
            hardButton.fontSize = 30
            menuButton.fontSize = 30
            
            
            
            
            
            
            easyButton.text = easyButton.text! + "'s Cup"
            hardButton.text = hardButton.text! + "'s Cup"
            menuButton.text = menuButton.text! + "'s Cup"
            
            easyBackground.position = CGPoint(x: -60, y: 180)
            hardBackground.position = CGPoint(x: -60, y: 0)
            menuBackground.position = CGPoint(x: -60, y: -180)
            
            
            
            
        }
        
        easyButton.position = CGPoint(x: 0, y: -30)
        hardButton.position = CGPoint(x: 0, y:  -30)
        menuButton.position = CGPoint(x: 0, y:  -30)
        backButton.position = CGPoint(x: 0, y:  -30)
        
        
        
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
        
        if backBackground.contains(touchLocation) {
            
            backBackground.color = SKColor.white
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        easyBackground.color = blue
        hardBackground.color = blue
        menuBackground.color = blue
        backBackground.color = blue
        
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
            
            //if let _ = UserDefaults.standard.value(forKey: "GalileoCourseFourGold") {
            
                if self.game_type == "time_trials" {
                    let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                    let gameScene = NewtonCourseSelectionScene(name: "Newton", type: game_type)
                    self.view?.presentScene(gameScene, transition: reveal)
                } else {
                    let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                    let gameScene = NewtonCourseOne(type: "grand_prix", previous_move_count: 0, number_of_lives: 3)
                    self.view?.presentScene(gameScene, transition: reveal)
                }
            
//            } else {
//                
//                let locked_out = SKSpriteNode(imageNamed: "lock")
//                
//                locked_out.position = CGPoint(x: 0, y: 0)
//                locked_out.zPosition = 2000000
//                
//                let fade_out = SKAction.fadeOut(withDuration: 1.0)
//                
//                addChild(locked_out)
//                
//                locked_out.run(fade_out)
//                
//            }
        }
        
        if menuBackground.contains(touchLocation){
            
//            if let _ = UserDefaults.standard.value(forKey: "GalileoCourseFourGold") {
//                
//                if let _ = UserDefaults.standard.value(forKey: "NewtonCourseFourGold") {
            
                    if self.game_type == "time_trials" {
                        let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                        let menuScene = EinsteinCourseSelectionScene(name: "Einstein", type: game_type)
                        self.view?.presentScene(menuScene, transition: reveal)
                    } else {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = EinsteinCourseOne(type: "grand_prix", previous_move_count: 0, number_of_lives: 3)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    
//                }
//                else {
//                    
//                    let locked_out = SKSpriteNode(imageNamed: "lock")
//                    
//                    locked_out.position = CGPoint(x: 0, y: 0)
//                    locked_out.zPosition = 2000000
//                    
//                    let fade_out = SKAction.fadeOut(withDuration: 1.0)
//                    
//                    addChild(locked_out)
//                    
//                    locked_out.run(fade_out)
//                }
//                
//            } else {
//                
//                
//                let locked_out = SKSpriteNode(imageNamed: "lock")
//                
//                locked_out.position = CGPoint(x: 0, y: 0)
//                locked_out.zPosition = 2000000
//                
//                let fade_out = SKAction.fadeOut(withDuration: 1.0)
//                
//                addChild(locked_out)
//                
//                locked_out.run(fade_out)
//            }
        }
    
        if backBackground.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let menuScene = MenuScene(size: CGSize(width: 750, height: 1334))
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
    
    
}
