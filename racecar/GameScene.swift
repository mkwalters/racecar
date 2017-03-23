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
    
    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()
    
    let grid = Grid(blockSize: 60.0, rows:17, cols:10)
    let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        
        
        x_velocity_display.text = "0"
        x_velocity_display.fontSize = 65
        x_velocity_display.fontColor = SKColor.white
        
        y_velocity_display.text = "0"
        y_velocity_display.fontSize = 65
        y_velocity_display.fontColor = SKColor.white
        
        x_velocity_display.position = CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 50)
        y_velocity_display.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
        

        
        self.addChild(x_velocity_display)
        self.addChild(y_velocity_display)
        
        let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 4
            , y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.name = "x_acceleration_button"
        
        let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
        x_deacceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.name = "x_deacceleration_button"
        
        let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.name = "y_acceleration_button"
        
        let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.name = "y_deacceleration_button"
        
        
        
        self.addChild(x_acceleration_button)
        self.addChild(x_deacceleration_button)
        self.addChild(y_acceleration_button)
        self.addChild(y_deacceleration_button)

        
        grid?.position = CGPoint (x:frame.midX, y:frame.midY)
        addChild(grid!)
        
        gamePiece.setScale(0.0625)
        gamePiece.position = (grid?.gridPosition(row: -1 * racecar.x_position, col: -1 *  racecar.y_position))!
        grid?.addChild(gamePiece)
        
        
    }
    
    
    func move() {
        print("remove")
        
        racecar.x_velocity += racecar.x_acceleration
        racecar.y_velocity += racecar.y_acceleration
        
        racecar.x_position = racecar.x_position + racecar.x_velocity
        racecar.y_position = racecar.y_position + racecar.y_velocity
        
        racecar.x_acceleration = 0
        racecar.y_acceleration = 0
        gamePiece.position = (grid?.gridPosition(row:  -1 * racecar.x_position , col: -1 *  racecar.y_position))!
        
        grid!.removeAllChildren()
        grid?.addChild(gamePiece)
        
        
    }
    
    override func sceneDidLoad() {
        
//        let x_velocity_display = SKLabelNode()
//        x_velocity_display.text = "You Win!"
//        x_velocity_display.fontSize = 65
//        x_velocity_display.fontColor = SKColor.green
//        x_velocity_display.position = CGPoint(x: frame.midX, y: frame.midY)
//        
//        addChild(x_velocity_display)
//        
//        let x_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
//        x_acceleration_button.position = CGPoint(x: -self.frame.width / 4
//            , y: -1 * self.frame.height / 2 + 50)
//        x_acceleration_button.name = "x_acceleration_button"
//        
//        let x_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
//        x_deacceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
//        x_deacceleration_button.name = "x_deacceleration_button"
//        
//        let y_acceleration_button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
//        y_acceleration_button.position = CGPoint(x: self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
//        y_acceleration_button.name = "y_acceleration_button"
//        
//        let y_deacceleration_button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 90, height: 90))
//        y_deacceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
//        y_deacceleration_button.name = "y_deacceleration_button"
//        
//        
//        
//        //x_velocity_display.position = CGPoint(x: frame.midX, y: frame.midY)
//        
//        self.addChild(x_acceleration_button)
//        self.addChild(x_deacceleration_button)
//        self.addChild(y_acceleration_button)
//        self.addChild(y_deacceleration_button)
//        
//        if let grid = Grid(blockSize: 120.0, rows:9, cols:5) {
//            grid.position = CGPoint (x:frame.midX, y:frame.midY)
//            addChild(grid)
//            
//            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
//            gamePiece.setScale(0.0625)
//            gamePiece.position = grid.gridPosition(row: 8, col: 2)
//            grid.addChild(gamePiece)
//        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            print("touch")
            
            
            
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
                
                else if name == "x_deacceleration_button"
                {
                    print("deaccelerate")
                    if racecar.x_acceleration > -1 {
                        racecar.x_acceleration -= 1
                        print(racecar.x_acceleration)
                    }
                }
                
                else if name == "y_acceleration_button"
                {
                    print("accelerate")
                    if racecar.y_acceleration < 1 {
                        racecar.y_acceleration += 1
                        print(racecar.y_acceleration)
                    }
                }
                
                else if name == "y_deacceleration_button"
                {
                    print("deaccelerate")
                    if racecar.y_acceleration > -1 {
                        racecar.y_acceleration -= 1
                        print(racecar.y_acceleration)
                    }
                }
            } else {
                move()
            }

            

        }
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //x_velocity_display.color = SKColor.red
        if racecar.x_acceleration == 1 {
            x_velocity_display.fontColor = SKColor.green
        } else if racecar.x_acceleration == -1 {
            x_velocity_display.fontColor = SKColor.red
        } else {
            x_velocity_display.fontColor = SKColor.white
        }
        
        if racecar.y_acceleration == 1 {
            y_velocity_display.fontColor = SKColor.green
        } else if racecar.y_acceleration == -1 {
            y_velocity_display.fontColor = SKColor.red
        } else {
            y_velocity_display.fontColor = SKColor.white
        }
        
        x_velocity_display.text = String(racecar.x_velocity + racecar.x_acceleration)
        y_velocity_display.text = String(racecar.y_velocity + racecar.y_acceleration)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for _ in touches {
            
            
        }
    }

}
