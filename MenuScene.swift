//
//  MenuScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/30/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.

//

//let yellow = UIColor(red: 252/255, green: 252/255, blue: 98/255, alpha: 1.0)
//let green = UIColor(red: 105/255, green: 153/255, blue: 98/255, alpha: 1.0)
//let blue = UIColor(red: 57/255, green: 70/255, blue: 72/255, alpha: 1.0)
//let purple = UIColor(red: 51/255, green: 0/255, blue: 54/255, alpha: 1.0)


let yellow = UIColor(red: 240/255, green: 200/255, blue: 8/255, alpha: 1.0)
let blue = UIColor(red: 8/255, green: 103/255, blue: 136/255, alpha: 1.0)
let white = UIColor(red: 255/255, green: 241/255, blue: 208/255, alpha: 1.0)
let red = UIColor(red: 221/255, green: 28/255, blue: 26/255, alpha: 1.0)



import SpriteKit

class MenuScene: SKScene {
    
    let GrandPrix = SKLabelNode()
    let GrandPrixBackground = SKSpriteNode(color: blue, size: CGSize(width: 475, height: 115)  )
    
    let TimeTrials = SKLabelNode()
    let TimeTrialsBackground = SKSpriteNode(color: blue, size: CGSize(width: 475, height: 115)  )
    
    let HowToPlay = SKLabelNode()
    let HowToPlayBackground = SKSpriteNode(color: blue, size: CGSize(width: 250, height: 115)  )
    
    let velocity_title = SKLabelNode(text: "Velocity")
    let vector_title = SKLabelNode(text: "Vector")


    override init(size: CGSize) {
        super.init(size: size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        backgroundColor = SKColor.black
        
        vector_title.position = CGPoint(x: CGFloat(100), y: self.frame.height / 2 - 400)
        vector_title.fontName = "FasterOne-Regular"
        vector_title.fontColor = yellow
        vector_title.fontSize = 110
        addChild(vector_title)
        
        velocity_title.position = CGPoint(x: CGFloat(-60), y: self.frame.height / 2 - 250)
        velocity_title.fontName = "FasterOne-Regular"
        velocity_title.fontColor = yellow
        velocity_title.fontSize = 110
        addChild(velocity_title)
        
        GrandPrixBackground.position = CGPoint(x: 0, y: 0)
        GrandPrixBackground.zPosition = 4
        addChild(GrandPrixBackground)
        
        GrandPrix.fontColor = yellow
        GrandPrix.fontName = "Arcade"
        GrandPrix.text = "Grand Prix"
        GrandPrix.fontSize = 100
        GrandPrix.position = CGPoint(x: 0, y: -50 )
        GrandPrix.zPosition = 5
        
        GrandPrixBackground.addChild(GrandPrix)
        

        
        
        
        TimeTrials.fontColor = yellow
        TimeTrials.fontName = "Arcade"
        TimeTrials.text = "Time Trials"
        TimeTrials.fontSize = 100
        TimeTrials.zPosition = 5
        
        TimeTrials.position = CGPoint(x: 0, y: -50)
        
        TimeTrialsBackground.position = CGPoint(x: 0, y: -180)
        TimeTrialsBackground.zPosition = 4
        
        addChild(TimeTrialsBackground)
        
        TimeTrialsBackground.addChild(TimeTrials)
        
        
        
        HowToPlayBackground.position = CGPoint(x: 0, y: -360)
        HowToPlayBackground.zPosition = 4
        
        addChild(HowToPlayBackground)
        
        HowToPlay.fontColor = yellow
        HowToPlay.fontName = "Arcade"
        HowToPlay.text = "Help"
        HowToPlay.fontSize = 100
        HowToPlay.zPosition = 5
        
        HowToPlay.position = CGPoint(x: 0, y: -50)
        
        HowToPlayBackground.addChild(HowToPlay)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if GrandPrixBackground.contains(touchLocation) {
            
            GrandPrixBackground.color = SKColor.white
            
        }
        
        if TimeTrialsBackground.contains(touchLocation) {
            
            TimeTrialsBackground.color = SKColor.white
            
        }
        
        if HowToPlayBackground.contains(touchLocation) {
            
            HowToPlayBackground.color = SKColor.white
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        GrandPrixBackground.color = blue
        TimeTrialsBackground.color = blue
        HowToPlayBackground.color = blue
        
        if GrandPrixBackground.contains(touchLocation) {
            //CGSize(width: 750, height: 1334)
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: "grand_prix")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if TimeTrialsBackground.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
            let gameScene = CupSelectionScene(size: CGSize(width: 750, height: 1334), type: "time_trials")
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        if HowToPlayBackground.contains(touchLocation) {
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.25)
            let difficultyScene = Tutorial(size: self.size)
            self.view?.presentScene(difficultyScene, transition: reveal)
            
        }
        
    }
    
    
}
