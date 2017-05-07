//
//  CourseSelectionScene.swift
//  racecar
//
//  Created by Walters Mitch on 4/10/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//


import Foundation

import SpriteKit


class CourseSelectionScene: SKScene {
    
    let easyButton = SKLabelNode()
    let easyButtonHighScore = SKLabelNode()
    let hardButton = SKLabelNode()
    let menuButton = SKLabelNode()
    
    let course_two = SKLabelNode()
    let course_two_highscore = SKLabelNode()
    
    
    let course_three = SKLabelNode()
    let course_three_highscore = SKLabelNode()
    
    let course_four = SKLabelNode()
    let course_four_highscore = SKLabelNode()
    
    var game_type = String()
    let title = SKLabelNode()
    
    init(name: String, type: String) {
        super.init(size: CGSize(width: 750, height: 1334))
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        backgroundColor = SKColor.black
        game_type = type
        //course one
        
        
        title.text = name
        title.position = CGPoint(x: 0, y: 475)
        title.fontSize = 110
        title.fontName = "FasterOne-Regular"
        title.fontColor = yellow
        
        
        addChild(title)
        
        
        //these should be in a set and looped over. 
    
        easyButton.fontColor = blue
        easyButton.text = "Course #1"
        easyButton.fontSize = 45
        // + "/" + "\(Int( TrophySystem.par_values()[ name + "CourseOne" ]! ))"
        
        easyButtonHighScore.text = "--"
        easyButtonHighScore.fontColor = yellow
        easyButtonHighScore.fontName = "PressStart2P"
        if let score = UserDefaults.standard.value(forKey: name + "CourseOne") {
            easyButtonHighScore.text = "\(score)"
        }
        
        easyButtonHighScore.text = easyButtonHighScore.text! + "/" + "\(Int( TrophySystem.par_values()[ name + "CourseOne" ]! ))"
        easyButtonHighScore.fontSize = 30
        
        //course two
        
        course_two.fontColor = yellow
        course_two.text = "Course #2"
        course_two.fontSize = 45
        
        course_two_highscore.text = "--"
        course_two_highscore.fontColor = blue
        course_two_highscore.fontName = "PressStart2P"
        if let score = UserDefaults.standard.value(forKey: name + "CourseTwo") {
            course_two_highscore.text = "\(score)"
        }
        course_two_highscore.text = course_two_highscore.text! + "/" + "\(Int( TrophySystem.par_values()[ name + "CourseTwo" ]! ))"
        course_two_highscore.fontSize = 30
        
        
        //course_three
        
        course_three.fontColor = blue
        course_three.text = "Course #3"
        course_three.fontSize = 45
        
        course_three_highscore.text = "--"
        course_three_highscore.fontColor = yellow
        course_three_highscore.fontSize = 30
        course_three_highscore.fontName = "PressStart2P"
        if let score = UserDefaults.standard.value(forKey: name + "CourseThree") {
            course_three_highscore.text = "\(score)"
        }
        course_three_highscore.text = course_three_highscore.text! + "/" + "\(Int( TrophySystem.par_values()[ name + "CourseThree" ]! ))"
        //course four
        
        course_four.fontColor = yellow
        course_four.text = "Course #4"
        course_four.fontSize = 45
        
        course_four_highscore.text = "--"
        course_four_highscore.fontColor = blue
        course_four_highscore.fontSize = 30
        course_four_highscore.fontName = "PressStart2P"
        if let score = UserDefaults.standard.value(forKey: name + "CourseFour") {
            course_four_highscore.text = "\(score)"
        }
        course_four_highscore.text = course_four_highscore.text! + "/" + "\(Int( TrophySystem.par_values()[ name + "CourseFour" ]! ))"
        
        
        hardButton.fontColor = blue
        hardButton.text = "Back"
        hardButton.fontSize = 55
        
        
        //CGPoint(x: -120, y:  220)
        easyButton.position = CGPoint(x: -120, y:  250)
        easyButtonHighScore.position = CGPoint(x: 220, y: 250)
        easyButton.fontName = "PressStart2P"
        course_two.position = CGPoint(x: -120, y: 100 )
        course_two_highscore.position = CGPoint(x: 220, y: 100)
        course_two.fontName = "PressStart2P"
        
        course_three.position = CGPoint(x: -120, y: -50 )
        course_three_highscore.position = CGPoint(x: 220, y: -50)
        
        course_three.fontName = "PressStart2P"
        
        course_four.position = CGPoint(x: -120, y: -200 )
        course_four_highscore.position = CGPoint(x: 220, y: -200)
        
        course_four.fontName = "PressStart2P"
        
        hardButton.position = CGPoint(x: 0, y: -400 )
        hardButton.fontName = "PressStart2P"
        
        addChild(easyButton)
        addChild(easyButtonHighScore)
        addChild(hardButton)
        addChild(course_two)
        addChild(course_two_highscore)
        addChild(course_three)
        addChild(course_three_highscore)
        addChild(course_four)
        addChild(course_four_highscore)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let touchLocation = touch!.location(in: self)
//        
//        if easyButton.contains(touchLocation) {
//            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
//            let gameScene = GalileoCourseOne()
//            self.view?.presentScene(gameScene, transition: reveal)
//        }
//        
//        if hardButton.contains(touchLocation){
//            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
//            let menuScene = CupSelectionScene(size: CGSize(width: 750, height: 1334))
//            self.view?.presentScene(menuScene, transition: reveal)
//        }
//        
//        if course_two.contains(touchLocation){
//            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
//            let menuScene = GalileoCourseTwo()
//            self.view?.presentScene(menuScene, transition: reveal)
//        }
//        
//        if course_three.contains(touchLocation){
//            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
//            let menuScene = GalileoCourseThree()
//            self.view?.presentScene(menuScene, transition: reveal)
//        }
//        
//        if course_four.contains(touchLocation){
//            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
//            let menuScene = GalileoCourseFour()
//            self.view?.presentScene(menuScene, transition: reveal)
//        }
//        
//    }
//    
    
}
