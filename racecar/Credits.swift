//
//  Credits.swift
//  racecar
//
//  Created by Walters Mitch on 5/6/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit

import SAConfettiView
import CoreGraphics


class Credits: SKScene {
    
    
    
    ///////// music
    
    ///////// fonts
    
    ///////// inspired by
    
    ///////// testers
    
    ///////// special thanks 
    
    
    
    ///////// GO JACKS
    
    
    let fontsize = 70
    var confettiView = SAConfettiView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var titles:[SKLabelNode] = []
    
    func drop_confetti() {
        
        
        confettiView = SAConfettiView(frame: (self.view?.bounds)!)
        confettiView.type = .Diamond
        confettiView.colors = [red, yellow, blue]
        self.view?.addSubview(confettiView)
        confettiView.startConfetti()
        
    }
    
    override func didMove(to view: SKView) {
        self.size = CGSize(width: 750, height: 1334)
        
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let audioooo = SKAudioNode(fileNamed: "13StuffRole")
        addChild(audioooo)
        
        drop_confetti()
        
        self.view?.addSubview(confettiView)
        
        self.backgroundColor = SKColor.black
        
        
        let background = SKSpriteNode(color: SKColor.black, size: CGSize(width: 1600, height: 7000))
        
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: 0, y: -5000)

        
        background.zPosition = 1
        
        addChild(background)
        
        
        
        
        
        titles.append(SKLabelNode(text: "Music"))
        titles.append(SKLabelNode(text: "Fonts"))
        titles.append(SKLabelNode(text: "Inspired By"))
        titles.append(SKLabelNode(text: "Testers"))
        titles.append(SKLabelNode(text: "Programmer"))
        titles.append(SKLabelNode(text: "Special Thanks"))
        titles.append(SKLabelNode(text: "GO JACKS"))
        titles.append(SKLabelNode(text: "Exit"))
        
        titles.last?.name = "exit"
        
        var starting_position = 3500
        
        for title in titles {
            
            title.position = CGPoint(x: 0, y: starting_position)
            title.zPosition = 2
            
            title.fontName = "FasterOne-Regular"
            title.fontSize = 70
            title.fontColor = yellow
            
            starting_position -= 1000
            
            
            background.addChild(title)
            
            
        }
        
        let content_fontsize = CGFloat(50)
        
        //// music
        
        let music_cred = SKLabelNode(text: "Ozzed")
        let music_cred_location = SKLabelNode(text: "www.ozzed.net")

        music_cred.position = CGPoint(x: 0, y: titles[0].position.y - 300)
        music_cred.fontName = "PressStart2P"
        music_cred.fontSize = content_fontsize
        
        
        music_cred_location.position = CGPoint(x: 0, y: titles[0].position.y - 600)
        music_cred_location.fontName = "PressStart2P"
        music_cred_location.fontSize = content_fontsize


        background.addChild(music_cred)
        background.addChild(music_cred_location)

        //// fonts
        
        let fonts_cred = SKLabelNode( text:"Eduardo Tunni")

        fonts_cred.position = CGPoint(x: 0, y: titles[1].position.y - 300)
        fonts_cred.fontName = "FasterOne-Regular"
        fonts_cred.fontSize = content_fontsize + 20


        background.addChild(fonts_cred)
        
        
        let fonts_cred1 = SKLabelNode( text:"codeman38")
        
        fonts_cred1.position = CGPoint(x: 0, y: titles[1].position.y - 600)
        fonts_cred1.fontName = "PressStart2P"
        fonts_cred1.fontSize = content_fontsize
        
        
        background.addChild(fonts_cred1)


//        //// inspired by

        
        let inspiration = SKLabelNode(text: "Eric Gardner")
        inspiration.position = CGPoint(x: 0, y: titles[2].position.y - 400)
        inspiration.fontName = "PressStart2P"
        inspiration.fontSize = content_fontsize

        background.addChild(inspiration)


        //// testers

        let tester1 = SKLabelNode(text: "Maitland Bobst")
        let tester2 = SKLabelNode(text: "Noah Ashford")
        let tester3 = SKLabelNode(text: "Christopher Viscarra")
        let tester4 = SKLabelNode(text: "J Patrick Lewis")
        let tester5 = SKLabelNode(text: "Matthew Walters")
        let tester6 = SKLabelNode(text: "C. Sittaphone")
        let tester7 = SKLabelNode(text: "Leah Dungo")
        
        
        tester1.position = CGPoint(x: 0, y: titles[3].position.y - 100)
        tester1.fontName = "PressStart2P"
        tester1.fontSize = content_fontsize - 20
        background.addChild(tester1)
        
        
        tester2.position = CGPoint(x: 0, y: titles[3].position.y - 200)
        tester2.fontName = "PressStart2P"
        tester2.fontSize = content_fontsize - 20
        background.addChild(tester2)
        
        tester3.position = CGPoint(x: 0, y: titles[3].position.y - 300)
        tester3.fontName = "PressStart2P"
        tester3.fontSize = content_fontsize - 20
        background.addChild(tester3)
        
        tester4.position = CGPoint(x: 0, y: titles[3].position.y - 400)
        tester4.fontName = "PressStart2P"
        tester4.fontSize = content_fontsize - 20
        background.addChild(tester4)

        tester5.position = CGPoint(x: 0, y: titles[3].position.y - 500)
        tester5.fontName = "PressStart2P"
        tester5.fontSize = content_fontsize - 20
        background.addChild(tester5)
        
        
        tester6.position = CGPoint(x: 0, y: titles[3].position.y - 600)
        tester6.fontName = "PressStart2P"
        tester6.fontSize = content_fontsize - 20
        background.addChild(tester6)
        
        
        
        tester7.position = CGPoint(x: 0, y: titles[3].position.y - 700)
        tester7.fontName = "PressStart2P"
        tester7.fontSize = content_fontsize - 20
        background.addChild(tester7)
        //// programmed by

        let programmed_by = SKLabelNode(text: "Mitchell Walters")
        programmed_by.position = CGPoint(x: 0, y: titles[4].position.y - 400)
        programmed_by.fontName = "PressStart2P"
        programmed_by.fontSize = content_fontsize - 10
        
        background.addChild(programmed_by)


        //// special thanks


        let mama = SKLabelNode(text: "Kelly Shew")
        mama.position = CGPoint(x: 0, y: titles[5].position.y - 300)
        mama.fontName = "PressStart2P"
        mama.fontSize = content_fontsize
        
        
        background.addChild(mama)
        
        
        let bro = SKLabelNode(text: "Matthew Walters")
        bro.position = CGPoint(x: 0, y: titles[5].position.y - 600)
        bro.fontName = "PressStart2P"
        bro.fontSize = content_fontsize - 10
        
        
        background.addChild(bro)
        
        //// Go Jacks
        
        //let go_jacks = SKLabelNode(text: "GO JACKS")
        
        
        let humboldt_logo = SKSpriteNode(imageNamed: "hsu_stacked")
        
        humboldt_logo.position = CGPoint(x: 0, y: titles[6].position.y - 200)
//        humboldt_logo.fontName = "PressStart2P"
//        humboldt_logo.fontSize = content_fontsize - 5
        
        background.addChild(humboldt_logo)

        
        let roll_credits = SKAction.moveBy(x: 0, y: 8500, duration: 40)
        
        background.run(roll_credits)
        
        
        
        
        
        
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            
            let positionInScene = touch.location(in: self)
            let touchedNode = atPoint(positionInScene)
            if let name = touchedNode.name
            {
                
                    if name == "exit"
                    {
                        
                        
                        let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
                        let menuScene = MenuScene(size: CGSize(width: 750, height: 1334))
                        self.view?.presentScene(menuScene, transition: reveal)
                    
                        confettiView.stopConfetti()
                    
                }
            }
        }
    }
    
    
    

        
        
    
    
    
    
    
    
    
}
