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
    
 
    let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 175, height: 88))
    
    let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 175, height: 88))
    
    
    let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 175, height: 88))
    
    let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 175, height: 88))
    
    
    let racecar = Racecar()
    
    let x_velocity_display = SKLabelNode(text: "placeholder")
    let y_velocity_display = SKLabelNode(text: "placeholder")
    
    override func sceneDidLoad() {
        
        let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 4
            , y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.name = "x_acceleration_button"
        
        let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
        x_deacceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.name = "x_deacceleration_button"
        
        let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        y_acceleration_button.position = CGPoint(x: self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.name = "y_acceleration_button"
        
        let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.name = "y_deacceleration_button"
        
        let x_velocity_display = SKLabelNode(text: String(racecar.x_velocity + 1))
        x_velocity_display.fontSize = 65
        x_velocity_display.position = CGPoint(x: -1 * self.frame.width / 2.5 , y: -1 * self.frame.height / 2 + 50)
        let y_velocity_display = SKLabelNode(text: "placeholder")
        y_velocity_display.position = CGPoint(x: self.frame.width / 8, y: -1 * self.frame.height / 2 + 50)
        
        
        //x_velocity_display.position = CGPoint(x: frame.midX, y: frame.midY)
        
        self.addChild(x_acceleration_button)
        self.addChild(x_deacceleration_button)
        self.addChild(y_acceleration_button)
        self.addChild(y_deacceleration_button)
        self.addChild(x_velocity_display)
        self.addChild(y_velocity_display)
        
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
                    if racecar.x_acceleration > -1 {
                        racecar.x_acceleration -= 1
                        print(racecar.x_acceleration)
                    }
                }
                
                if name == "y_acceleration_button"
                {
                    print("accelerate")
                    if racecar.y_acceleration < 1 {
                        racecar.y_acceleration += 1
                        print(racecar.y_acceleration)
                    }
                }
                
                if name == "y_deacceleration_button"
                {
                    print("deaccelerate")
                    if racecar.y_acceleration > -1 {
                        racecar.y_acceleration -= 1
                        print(racecar.y_acceleration)
                    }
                }
            }

            

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for _ in touches {
            

        }
    }
    

}
