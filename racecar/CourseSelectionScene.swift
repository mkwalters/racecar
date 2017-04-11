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
    
    
    init(name: String) {
        super.init(size: CGSize(width: 750, height: 1334))
        
        self.size = CGSize(width: 750, height: 1334)
        backgroundColor = SKColor.black
        
        //course one
        
        easyButton.fontColor = SKColor.purple
        easyButton.text = name + " Course #1"
        easyButton.fontSize = 50
        
        
        easyButtonHighScore.text = "0"
        easyButtonHighScore.fontColor = SKColor.purple
        if let score = UserDefaults.standard.value(forKey: name + "CourseOne") {
            easyButtonHighScore.text = "\(score)"
        }
        easyButtonHighScore.fontSize = 50
        
        
        //course two
        
        course_two.fontColor = SKColor.purple
        course_two.text = name + " Course #2"
        course_two.fontSize = 50
        
        course_two_highscore.text = "0"
        course_two_highscore.fontColor = SKColor.purple
        if let score = UserDefaults.standard.value(forKey: name + "CourseTwo") {
            course_two_highscore.text = "\(score)"
        }
        course_two_highscore.fontSize = 50
        
        
        //course_three
        
        course_three.fontColor = SKColor.purple
        course_three.text = name + " Course #3"
        course_three.fontSize = 50
        
        course_three_highscore.text = "0"
        course_three_highscore.fontColor = SKColor.purple
        course_three_highscore.fontSize = 50
        if let score = UserDefaults.standard.value(forKey: name + "CourseThree") {
            course_three_highscore.text = "\(score)"
        }
        
        //course four
        
        course_four.fontColor = SKColor.purple
        course_four.text = name + " Course #4"
        course_four.fontSize = 50
        
        course_four_highscore.text = "0"
        course_four_highscore.fontColor = SKColor.purple
        course_four_highscore.fontSize = 50
        if let score = UserDefaults.standard.value(forKey: name + "CourseFour") {
            course_four_highscore.text = "\(score)"
        }
        
        
        
        hardButton.fontColor = SKColor.purple
        hardButton.text = "Back"
        hardButton.fontSize = 60
        
        
        
        easyButton.position = CGPoint(x: size.width / 2 - 100, y:  size.height / 3 + 400)
        easyButtonHighScore.position = CGPoint(x: size.width - 100, y: size.height / 3 + 400)
        
        course_two.position = CGPoint(x: size.width / 2 - 100, y: size.height / 3 + 300)
        course_two_highscore.position = CGPoint(x: size.width - 100, y: size.height / 3 + 300)
        
        course_three.position = CGPoint(x: size.width / 2 - 100, y: size.height / 3 + 200)
        course_three_highscore.position = CGPoint(x: size.width - 100 , y: size.height / 3 + 200)
        
        course_four.position = CGPoint(x: size.width / 2 - 100, y: size.height / 3 + 100)
        course_four_highscore.position = CGPoint(x: size.width - 100, y: size.height / 3 + 100)
        
        hardButton.position = CGPoint(x: size.width / 2, y: 150)
        
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
