//
//  GameScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/20/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 175, height: 88))
    
    let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 175, height: 88))
    
    
    let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 175, height: 88))
    
    let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 175, height: 88))
    
    
    let racecar = Racecar()
    
    override func sceneDidLoad() {
        
        let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 125, height: 88))
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 3, y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.name = "x_acceleration_button"
        
        let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 125, height: 88))
        x_deacceleration_button.position = CGPoint(x: -self.frame.width / 8, y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.name = "x_deacceleration_button"
        
        let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 125, height: 88))
        y_acceleration_button.position = CGPoint(x: self.frame.width / 8, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.name = "y_acceleration_button"
        
        let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 125, height: 88))
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 3, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.name = "y_deacceleration_button"
        
        
        
        self.addChild(x_acceleration_button)
        self.addChild(x_deacceleration_button)
        self.addChild(y_acceleration_button)
        self.addChild(y_deacceleration_button)
        
        if let grid = Grid(blockSize: 120.0, rows:9, cols:5) {
            grid.position = CGPoint (x:frame.midX, y:frame.midY)
            addChild(grid)
            
            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
            gamePiece.setScale(0.0625)
            gamePiece.position = grid.gridPosition(row: 8, col: 2)
            grid.addChild(gamePiece)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            x_acceleration_button.name = "x_acceleration_button"
            let positionInScene = touch.location(in: self)
            let touchedNode = atPoint(positionInScene)
            if let name = touchedNode.name
            {
                if name == "x_acceleration_button"
                {
                    print("accelerate")
                    if racecar.x_acceleration < 1 {
                        racecar.x_acceleration += 1
                        print(racecar.x_acceleration)
                    }
                }
                
                if name == "x_deacceleration_button"
                {
                    print("deaccelerate")
                    if racecar.x_acceleration > -1{
                        racecar.x_acceleration -= 1
                        print(racecar.x_acceleration)
                    }
                }
            }

            

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            
//            print("touches ended")
//            let location = touch.location(in: view)
//            print(location)
//            if x_acceleration_button.contains(location) {
//                print("tapped!")
//            }
            
        
        
//        let touch:UITouch = touches.anyObject()! as UITouch
            
//            x_acceleration_button.name = "x_acceleration_button"
//            x_acceleration_button.isUserInteractionEnabled = false
//            let positionInScene = touch.location(in: self)
//            let touchedNode = self.atPoint(positionInScene)
//            
//            if let name = touchedNode.name
//            {
//                if name == "x_acceleration_button"
//                {
//                    print("Touched")
//                }
//            }
        }
    }
    

}
