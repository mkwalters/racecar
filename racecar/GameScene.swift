//
//  GameScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/20/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics

struct physicsCategory {
    
    static let projected_velocity: UInt32 = 0x1 << 1
    static let obstacle: UInt32 = 0x1 << 2
    //    static let Ground : UInt32 = 0x1 << 2
    //    static let Wall : UInt32 = 0x1 << 3
}


let rows = 33
let cols = 19
let block_size = CGFloat(35.0)


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
//    let swipeRightRec = UISwipeGestureRecognizer()
//    let swipeLeftRec = UISwipeGestureRecognizer()
//    let swipeUpRec = UISwipeGestureRecognizer()
//    let swipeDownRec = UISwipeGestureRecognizer()
//    
 
    let x_acceleration_button = SKSpriteNode(imageNamed: "right_red")
    
    let x_deacceleration_button = SKSpriteNode(imageNamed: "left_blue")
    
    
    let y_acceleration_button = SKSpriteNode(imageNamed: "up_red")
    
    let y_deacceleration_button = SKSpriteNode(imageNamed: "down_blue")
    
    

    
    let racecar = Racecar(x_pos: 16, y_pos: 20)
    
    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()
    
    let grid = Grid(blockSize: block_size, rows:rows, cols:cols)
    let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
    let projected_velocity = SKSpriteNode(imageNamed: "red")
    let vroom = SKSpriteNode(imageNamed: "red")
    
    var obstacles:[(x: Int, y: Int)] = []

    var previous_locations:[(x: Int, y: Int)] = []
    
    var available_locations:[(x: Int, y: Int)] = []
    
    let projected_path = SKShapeNode()
    
    
    
    func draw_projected_path() {
        
        
        projected_path.removeFromParent()
        
        let starting_position = grid?.gridPosition(row:  racecar.y_position, col: racecar.x_position)
        
        
        let ending_position = grid?.gridPosition(row:  racecar.y_position - racecar.y_velocity - racecar.y_acceleration, col: racecar.x_position + racecar.x_velocity + racecar.x_acceleration)
        
        let line_path:CGMutablePath = CGMutablePath()
        line_path.move(to: starting_position!)
        line_path.addLine(to: ending_position!)
        
        
        projected_path.zPosition = 200000
        projected_path.path = line_path
        projected_path.strokeColor = SKColor.green
        projected_path.lineWidth = 2
        
        projected_path.physicsBody = SKPhysicsBody(edgeChainFrom: line_path)
        projected_path.physicsBody?.categoryBitMask = physicsCategory.projected_velocity
        projected_path.physicsBody?.collisionBitMask = physicsCategory.obstacle
        projected_path.physicsBody?.contactTestBitMask = physicsCategory.obstacle
        projected_path.physicsBody?.isDynamic = true
        projected_path.physicsBody?.affectedByGravity = false
        
        
        grid?.addChild(projected_path)
        
        
    }
    
    
    func draw_line(x1: Int, x2: Int, y1: Int, y2: Int) {
        let line_path:CGMutablePath = CGMutablePath()
        line_path.move(to: CGPoint(x: x1, y: y1))
        line_path.addLine(to: CGPoint(x: x2, y: y2))
        
        let shape = SKShapeNode()
        shape.zPosition = 200000
        shape.path = line_path
        shape.strokeColor = SKColor.white
        shape.lineWidth = 2
        grid?.addChild(shape)
    }
//    
//    func swipedRight() {
//        
//        print("Right")
//        
//        let scroll = SKAction.move(by: CGVector(dx: 240, dy: 0), duration: 0.5)
//        
//        grid?.run(scroll)
//        
//    }
//    
//    func swipedLeft() {
//        
//        print("Left")
//        
//        let scroll = SKAction.move(by: CGVector(dx: -240, dy: 0), duration: 0.4)
//        
//        grid?.run(scroll)
//    }
//    
//    func swipedUp() {
//        
//        print("Up")
//        
//        
//        let scroll = SKAction.move(by: CGVector(dx: 0, dy: 200), duration: 0.4)
//        
//        grid?.run(scroll)
//    }
//    
//    func swipedDown() {
//        
//        print("Down")
////        grid?.physicsBody?.applyForce(CGVector(dx: 0, dy: 80))
////        let delay = SKAction.wait(forDuration: 3.15)
////        grid?.physicsBody?.applyForce(CGVector(dx: 0, dy: -80))
//        
//        
//        let scroll = SKAction.move(by: CGVector(dx: 0, dy: -200), duration: 0.4)
//        
//        grid?.run(scroll)
//    }

    

    
    override func didMove(to view: SKView) {

        
        self.physicsWorld.contactDelegate = self

        
        
        
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
        grid?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        grid?.physicsBody?.affectedByGravity = false

        addChild(grid!)
        
        gamePiece.setScale(0.0625)
        gamePiece.position = (grid?.gridPosition(row:  racecar.y_position, col:  racecar.x_position))!
        gamePiece.zPosition = 20
        
        
        grid?.addChild(projected_path)
        
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
        grid?.addChild(gamePiece)
        
        draw_projected_path()
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
            
            grid?.position = CGPoint(x: ((position?.x)! + x_translation), y: ( (position?.y)! - y_translation) )
            
                

                    
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
