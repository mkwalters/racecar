//
//  EasyRaceScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/31/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


//var rows = 42
//var cols = 32
//var block_size = CGFloat(35.0)


class EasyRaceScene: SKScene, SKPhysicsContactDelegate {
    
    
    //    let swipeRightRec = UISwipeGestureRecognizer()
    //    let swipeLeftRec = UISwipeGestureRecognizer()
    //    let swipeUpRec = UISwipeGestureRecognizer()
    //    let swipeDownRec = UISwipeGestureRecognizer()
    //
    
    let x_acceleration_button = SKSpriteNode(imageNamed: "right_red")
    
    let x_deacceleration_button = SKSpriteNode(imageNamed: "left_blue")
    
    
    let y_acceleration_button = SKSpriteNode(imageNamed: "up_red")
    
    let y_deacceleration_button = SKSpriteNode(imageNamed: "down_blue")
    
    var gameDifficulty = String()
    
    
    let racecar = Racecar(x_pos: 17, y_pos: 35)
    
    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()
    
    let grid = Grid(blockSize: block_size, rows:50, cols:20)
    let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
    let opponentGamePiece = SKSpriteNode(imageNamed: "Spaceship")
    
    let projected_velocity = SKSpriteNode(imageNamed: "red")
    let vroom = SKSpriteNode(imageNamed: "red")
    
    var obstacles:[(x: Int, y: Int)] = []
    
    var bot_path:[(x: Int, y: Int)] = []
    
    var previous_locations:[(x: Int, y: Int)] = []
    
    var available_locations:[(x: Int, y: Int)] = []
    
    let projected_path = SKShapeNode()
    
    let timer = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 30, height: 30))
    
    var time_between_moves = 3
    
    var turn_number = 0
    
    
    
    
    
    func draw_projected_path() {
        
        
        projected_path.removeFromParent()
        
        self.backgroundColor = SKColor.black
        
        let starting_position = grid?.gridPosition(row:  racecar.y_position, col: racecar.x_position)
        
        
        let ending_position = grid?.gridPosition(row:  racecar.y_position - racecar.y_velocity - racecar.y_acceleration, col: racecar.x_position + racecar.x_velocity + racecar.x_acceleration)
        
        let line_path:CGMutablePath = CGMutablePath()
        line_path.move(to: starting_position!)
        line_path.addLine(to: ending_position!)
        
        
        projected_path.zPosition = 200
        projected_path.path = line_path
        projected_path.strokeColor = SKColor.green
        projected_path.lineWidth = 2
        
        projected_path.name = "projected_path"
        
        projected_path.physicsBody = SKPhysicsBody(edgeChainFrom: line_path)
        projected_path.physicsBody?.categoryBitMask = physicsCategory.projected_velocity
        projected_path.physicsBody?.collisionBitMask = physicsCategory.obstacle
        projected_path.physicsBody?.contactTestBitMask = physicsCategory.obstacle
        projected_path.physicsBody?.isDynamic = true
        projected_path.physicsBody?.affectedByGravity = false
        projected_path.physicsBody?.pinned = true
        
        
        grid?.addChild(projected_path)
        
        
    }
    
    init(size: CGSize, difficulty: String) {
        super.init(size: size)
        gameDifficulty = difficulty
        
        if difficulty == "hard"{
            time_between_moves = 2
        } else {
            time_between_moves = 4
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func build_bot_path() {
        
        bot_path = [
            (x: 19,y: 28),
            (x: 17,y: 28),
            (x: 15,y: 28),
            (x: 12,y: 28),
            (x: 10,y: 28),
            (x: 8,y: 27),
            (x: 6,y: 27),
            (x: 4,y: 26),
            (x: 3,y: 24),
            (x: 3,y: 21),
            (x: 4,y: 19),
            (x: 6,y: 18),
            (x: 8,y: 18),
            (x: 10,y: 18),
            (x: 12,y: 17),
            (x: 13,y: 15),
            (x: 14,y: 14),
            (x: 14,y: 12),
            (x: 13,y: 10),
            (x: 13,y: 11),
            (x: 11,y: 11),
            (x: 8,y: 11),
            (x: 6,y: 10),
            (x: 5,y: 8),
            (x: 5,y: 6),
            (x: 6,y: 4),
            (x: 8,y: 3),
            (x: 11,y: 3),
            (x: 14,y: 2),
            (x: 16,y: 2),
            (x: 18,y: 2),
            (x: 21,y: 2),
            (x: 23,y: 2),
            (x: 24,y: 3),
            (x: 25,y: 4),
            (x: 25,y: 6),
            (x: 25,y: 8),
            (x: 26,y: 9),
            (x: 28,y: 9),
            (x: 29,y: 9),
            (x: 29,y: 8),
            (x: 29,y: 6),
            (x: 30,y: 4),
            (x: 32,y: 2),
            (x: 34,y: 1),
            (x: 36,y: 1),
            (x: 38,y: 2),
            (x: 40,y: 3),
            (x: 41,y: 4),
            (x: 41,y: 7),
            (x: 41,y: 10),
            (x: 41,y: 13),
            (x: 41,y: 15),
            (x: 40,y: 17),
            (x: 38,y: 18),
            (x: 36,y: 18),
            (x: 34,y: 18),
            (x: 33,y: 29),
            (x: 33,y: 21),
            (x: 34,y: 22),
            (x: 36,y: 22),
            (x: 38,y: 22),
            (x: 39,y: 23),
            (x: 40,y: 24),
            (x: 40,y: 26),
            (x: 39,y: 28)
            
            
            
            
        ]
    }
    
    
    func draw_line(x1: Int, x2: Int, y1: Int, y2: Int) {
        let line_path:CGMutablePath = CGMutablePath()
        line_path.move(to: CGPoint(x: x1, y: y1))
        line_path.addLine(to: CGPoint(x: x2, y: y2))
        
        let shape = SKShapeNode()
        shape.zPosition = 210
        shape.path = line_path
        shape.strokeColor = SKColor.white
        shape.lineWidth = 2
        grid?.addChild(shape)
    }
    
    func handlePinchFrom(_ sender: UIPinchGestureRecognizer) {
        
        let pinch = SKAction.scale(by: sender.scale, duration: 0.0)
        
        grid?.run(pinch)
        sender.scale = 1.0
        
    }
    
    
    override func didMove(to view: SKView) {
        
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        
        
        build_bot_path()
        print(bot_path)
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchFrom(_:)))
        self.view?.addGestureRecognizer(pinchGesture)
        
        projected_path.strokeColor = SKColor.green
        
        
        timer.position = CGPoint(x: -self.frame.width / 2 + timer.size.width , y: self.frame.height / 2 - timer.size.height)
        timer.zPosition = 20000000
        
        addChild(timer)
        
        
        self.physicsWorld.contactDelegate = self
        
        
        
        //        var count = available_locations.count - 2
        //
        //        while count > 0 {
        //
        //            if obstacles.contains(where: { $0 == available_locations[count] }) {
        //                available_locations.remove(at: count)
        //                count += 1
        //            }
        //            count -= 1
        //
        //        }
        //
        
        
        
        for j in 3...14{
            
            for i in 5...45 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        x_velocity_display.text = "0"
        x_velocity_display.fontSize = 65
        x_velocity_display.fontColor = SKColor.white
        
        y_velocity_display.text = "0"
        y_velocity_display.fontSize = 65
        y_velocity_display.fontColor = SKColor.white
        
        //these z positions should always be the highest
        
        x_velocity_display.position =  CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 50)
        x_velocity_display.zPosition = 2000000
        
        y_velocity_display.position = CGPoint(x: -self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        x_velocity_display.zPosition = 2000000
        
        
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.zPosition = 2000000
        
        x_deacceleration_button.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.zPosition = 2000000
        
        y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.zPosition = 2000000
        
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.zPosition = 2000000
        
        
        
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
        
        
        grid?.position = CGPoint(x: -300, y: 0)
        addChild(grid!)
        
        
        gamePiece.setScale(0.0625)
        gamePiece.position = (grid?.gridPosition(row:  racecar.y_position, col:  racecar.x_position))!
        gamePiece.zPosition = 2002
        
        
        opponentGamePiece.position = (grid?.gridPosition(row:  racecar.y_position - 1, col:  racecar.x_position))!
        opponentGamePiece.setScale(0.0625)
        opponentGamePiece.zPosition = 2002
        
        
        grid?.addChild(projected_path)
        //grid?.addChild(opponentGamePiece)
        
        let spawn = SKAction.run({
            () in
            self.move()
            
        })
        
        
        let delay = SKAction.wait(forDuration: TimeInterval(time_between_moves))
        
        
        
        let SpawnDelay = SKAction.sequence([spawn, delay])
        
        let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
        self.run(spawnDelayForever)
        
        for obstacle in obstacles {
            
            let current_obstacle = SKSpriteNode(color: SKColor.purple, size: CGSize(width: 30, height: 30))
            current_obstacle.position = (grid?.gridPosition(row:  obstacle.x, col:  obstacle.y))!
            
            current_obstacle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 30))
            current_obstacle.physicsBody?.categoryBitMask = physicsCategory.obstacle
            current_obstacle.physicsBody?.collisionBitMask = 0
            current_obstacle.physicsBody?.contactTestBitMask = physicsCategory.projected_velocity
            current_obstacle.physicsBody?.isDynamic = true
            //current_obstacle.physicsBody?.pinned = true
            
            current_obstacle.physicsBody?.affectedByGravity = false
            
            
            grid?.addChild(current_obstacle)
            
        }
        
        projected_velocity.setScale(0.0625)
        projected_velocity.position = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
        gamePiece.zPosition = 19
        
        grid?.addChild(projected_velocity)
        grid?.addChild(gamePiece)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        
        
        print("About to crash!")
        projected_path.strokeColor = SKColor.red
        
        
        
    }
    
    func move_opponent() {
        if turn_number < bot_path.count {
            opponentGamePiece.position = (grid?.gridPosition(row:  bot_path[turn_number].x , col: bot_path[turn_number].y))!
        }
        
    }
    
    
    func move() {
        
        turn_number += 1
        
        if projected_path.strokeColor == SKColor.green {
            
            timer.removeAllActions()
            timer.size = CGSize(width: 0, height: 30)
            
            
            let timing = SKAction.resize(toWidth: 2 * self.frame.width, duration: TimeInterval(time_between_moves))
            
            timer.run(timing)
            
            
            let starting_point = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
            
            
            let starting_x_position = Int(starting_point.x)
            let starting_y_position = Int(starting_point.y)
            
            previous_locations.append((x: racecar.x_position, y: racecar.y_position))
            
            let previous_location_node = SKSpriteNode(color: SKColor.green, size: CGSize(width: 10, height: 10))
            previous_location_node.position = (grid?.gridPosition(row: racecar.y_position, col: racecar.x_position))!
            previous_location_node.zPosition = 40
            
            grid?.addChild(previous_location_node)
            
            
            racecar.apply_acceleration()
            
            racecar.x_position = racecar.x_position + racecar.x_velocity
            racecar.y_position = racecar.y_position - racecar.y_velocity
            
            
            let ending_point = (grid?.gridPosition(row:  racecar.y_position  , col: racecar.x_position))!
            
            let ending_x_position = Int(ending_point.x)
            let ending_y_position = Int(ending_point.y)
            
            gamePiece.position = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
            
            
            //        print(starting_x_position)
            //        print(starting_y_position)
            //        print(ending_x_position)
            //        print(ending_y_position)
            
            draw_line(x1: starting_x_position ,x2: ending_x_position ,y1: starting_y_position,y2: ending_y_position)
            
            
            gamePiece.removeFromParent()
            move_opponent()
            grid?.addChild(gamePiece)
            
            draw_projected_path()
            //grid?.addChild(projected_velocity)
        } else {
            
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
            
        }
        
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
                        
                        draw_projected_path()
                    }
                }
                    
                else if name == "x_deacceleration_button"
                {
                    
                    if racecar.x_acceleration > -1 {
                        racecar.x_acceleration -= 1
                        
                        draw_projected_path()
                        
                    }
                }
                    
                else if name == "y_acceleration_button"
                {
                    
                    if racecar.y_acceleration < 1 {
                        racecar.y_acceleration += 1
                        
                        draw_projected_path()
                        
                    }
                }
                    
                else if name == "y_deacceleration_button"
                {
                    
                    if racecar.y_acceleration > -1 {
                        racecar.y_acceleration -= 1
                        
                        draw_projected_path()
                        
                    }
                }
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            //Get the current position in scene of the touch.
            let location = touch.location(in: view)
            //Get the previous position in scene of the touch.
            let previousLocation = touch.previousLocation(in: view)
            //Calculate the translation.
            //let translation = CGPoint((location.x - previousLocation.x), (location.y - previousLocation.y))
            
            let x_translation = location.x - previousLocation.x
            let y_translation = location.y - previousLocation.y
            //Get the current position in scene of the crossHair.
            let position = grid?.position
            // Get the bode touched
            //var body = self.nodeAtPoint(location)
            
            grid?.position = CGPoint(x: ((position?.x)! + x_translation * 2), y: ( (position?.y)! - y_translation * 2) )
            
            
            
            
            //Set the position of the crosshair to its current position plus the translation.
            //grid?.position = CGPoint(x: ((position?.x)! + x_translation * 2), y: ( (position?.y)! + y_translation * 2) )
            //Set the position of the body
            //body.position = location
            
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
