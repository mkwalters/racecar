//
//  GameScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/20/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import SpriteKit
import GameplayKit

let rows = 33
let cols = 19


class GameScene: SKScene {
    
 
    let x_acceleration_button = SKSpriteNode(imageNamed: "right_red")
    
    let x_deacceleration_button = SKSpriteNode(imageNamed: "left_blue")
    
    
    let y_acceleration_button = SKSpriteNode(imageNamed: "up_red")
    
    let y_deacceleration_button = SKSpriteNode(imageNamed: "down_blue")
    

    
    let racecar = Racecar(x_pos: 16, y_pos: 20)
    
    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()
    
    let grid = Grid(blockSize: 35.0, rows:rows, cols:cols)
    let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
    let projected_velocity = SKSpriteNode(imageNamed: "red")
    let vroom = SKSpriteNode(imageNamed: "red")
    
    var obstacles:[(x: Int, y: Int)] = []

    var previous_locations:[(x: Int, y: Int)] = []
    
    var available_locations:[(x: Int, y: Int)] = []

    

    
    override func didMove(to view: SKView) {
        
        for i in 6...(rows-6) {
            
            for j in 4...(cols-6) {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        
        
        
        for i in 0...(rows-1) {
            
            for j in 0...(cols-1) {
                
                available_locations.append(x: i, y: j)
                
            }
        }
        
        var count = available_locations.count - 2
        
        while count > 0 {
            
            if obstacles.contains(where: { $0 == available_locations[count] }) {
                available_locations.remove(at: count)
                count += 1
            }
            count -= 1
            
        }
        
        
        x_velocity_display.text = "0"
        x_velocity_display.fontSize = 65
        x_velocity_display.fontColor = SKColor.white
        
        y_velocity_display.text = "0"
        y_velocity_display.fontSize = 65
        y_velocity_display.fontColor = SKColor.white
        
//        x_velocity_display.position = CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 50)
//        y_velocity_display.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
        

        
//        x_velocity_display.position = CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 50)
//        y_velocity_display.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
//        x_acceleration_button.position = CGPoint(x: -self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
//        x_deacceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
//        y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
//        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        
        x_velocity_display.position = CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 50)
        y_velocity_display.position = CGPoint(x: -self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        
        
        
        x_acceleration_button.setScale(0.35)
        //x_acceleration_button.position = CGPoint(x: -self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.name = "x_acceleration_button"
        
        x_deacceleration_button.setScale(0.35)
        //x_deacceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.name = "x_deacceleration_button"
        
        y_acceleration_button.setScale(0.35)
        //y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.name = "y_acceleration_button"
        
        y_deacceleration_button.setScale(0.35)
        //y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.name = "y_deacceleration_button"
        
        
//        let vroom = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
//        vroom.position = CGPoint(x: 0, y: self.frame.height / 2 - 50)
//        vroom.name = "vroom"
        
        
        self.addChild(x_velocity_display)
        self.addChild(y_velocity_display)
        self.addChild(x_acceleration_button)
        self.addChild(x_deacceleration_button)
        self.addChild(y_acceleration_button)
        self.addChild(y_deacceleration_button)
        //self.addChild(vroom)

        
        grid?.position = CGPoint (x:frame.midX, y:frame.midY+50)
        addChild(grid!)
        
        gamePiece.setScale(0.0625)
        gamePiece.position = (grid?.gridPosition(row:  racecar.y_position, col:  racecar.x_position))!
        gamePiece.zPosition = 20
        
        let spawn = SKAction.run({
            () in
            self.move()
        })
        
        
        let delay = SKAction.wait(forDuration: 3.15)
        
        let SpawnDelay = SKAction.sequence([spawn, delay])
        
        let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
        self.run(spawnDelayForever)
        
        for obstacle in obstacles {
            
            let current_obstacle = SKSpriteNode(color: SKColor.red, size: CGSize(width: 30, height: 30))
            current_obstacle.position = (grid?.gridPosition(row:  obstacle.x, col:  obstacle.y))!
            grid?.addChild(current_obstacle)
            
        }
        
        projected_velocity.setScale(0.0625)
        projected_velocity.position = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
        gamePiece.zPosition = 19
        
        grid?.addChild(projected_velocity)
        grid?.addChild(gamePiece)

        
        
    }
    
    
    func move() {
        
        previous_locations.append((x: racecar.x_position, y: racecar.y_position))
        
        let previous_location_node = SKSpriteNode(color: SKColor.green, size: CGSize(width: 10, height: 10))
        previous_location_node.position = (grid?.gridPosition(row: racecar.y_position, col: racecar.x_position))!
        previous_location_node.zPosition = 40
        
        grid?.addChild(previous_location_node)
        
        
        racecar.apply_acceleration()
        
        racecar.x_position = racecar.x_position + racecar.x_velocity
        racecar.y_position = racecar.y_position - racecar.y_velocity

        gamePiece.position = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
        
        
        gamePiece.removeFromParent()
        grid?.addChild(gamePiece)
        //grid?.addChild(projected_velocity)
        
        
    }
    
    override func sceneDidLoad() {
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {

            
            
            
            let positionInScene = touch.location(in: self)
            let touchedNode = atPoint(positionInScene)
            if let name = touchedNode.name
            {
                if name == "x_acceleration_button"
                {

                    if racecar.x_acceleration < 1 {
                        racecar.x_acceleration += 1
                        print(racecar.x_acceleration)

                    }
                }
                
                else if name == "x_deacceleration_button"
                {
                    
                    if racecar.x_acceleration > -1 {
                        racecar.x_acceleration -= 1
                        print(racecar.x_acceleration)
                    }
                }
                
                else if name == "y_acceleration_button"
                {
                    
                    if racecar.y_acceleration < 1 {
                        racecar.y_acceleration += 1
                        print(racecar.y_acceleration)
                    }
                }
                
                else if name == "y_deacceleration_button"
                {
                    
                    if racecar.y_acceleration > -1 {
                        racecar.y_acceleration -= 1
                        print(racecar.y_acceleration)
                    }
                }
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
        
        projected_velocity.position = (grid?.gridPosition(row:  racecar.y_position - racecar.y_velocity - racecar.y_acceleration, col: racecar.x_position + racecar.x_velocity + racecar.x_acceleration))!
        

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for _ in touches {
            
            
        }
    }

}
