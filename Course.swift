//
//  Course.swift
//  racecar
//
//  Created by Walters Mitch on 4/1/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics





class Course: SKScene, SKPhysicsContactDelegate {


    let x_acceleration_button = SKSpriteNode(imageNamed: "right_red")

    let x_deacceleration_button = SKSpriteNode(imageNamed: "left_blue")


    let y_acceleration_button = SKSpriteNode(imageNamed: "up_red")

    let y_deacceleration_button = SKSpriteNode(imageNamed: "down_blue")
    
    var UIBackground = SKShapeNode(rectOf: CGSize(width: 1334 , height: 150))

    var gameDifficulty = String()


    var racecar = Racecar(x_pos: 29, y_pos: 20)

    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()

    var grid = Grid(blockSize: CGFloat(35.0), rows:42, cols:32)
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

    var time_between_moves = CGFloat()

    var turn_number = 0

    var finish_line = SKSpriteNode()

    var checkpoint_one = SKSpriteNode()
    
    var checkpoint_two = SKSpriteNode()

    var last_checkpoint = 0
    
    let pause_background = SKShapeNode(rectOf: CGSize(width: 500, height: 1000))
    let crash_background = SKShapeNode(rectOf: CGSize(width: 500, height: 1000))

    var number_of_moves = 0
    
    var number_of_moves_label = SKLabelNode()
    
    var key = "GalileoCourseOne"
    
    var original_grid_size = CGSize()
    
    let pause = SKSpriteNode(imageNamed: "pause_button")
    
    var resume = SKLabelNode()
    
    
    var restart = SKLabelNode()
    
    var crashed_out = SKLabelNode(text: "Crashed out!")
    
    var crash_restart = SKLabelNode()
    var exit = SKLabelNode()
    var crash_exit = SKLabelNode()

    var paused_game = false
    var crossing_finish_line = false
    
    var game_type = String()
    
    var audioooo = SKAudioNode(fileNamed: "Bloodrocuted")
    
    var colors = [UIColor]()
    var color1 = UIColor(red: 255/255, green: 230/255, blue: 109/255, alpha: 1.0)
    var color2 = UIColor(red: 47/255, green: 48/255, blue: 97/255, alpha: 1.0)
    var color3 = UIColor(red: 247/255, green: 255/255, blue: 247/255, alpha: 1.0)
    
    
    
    func draw_projected_path() {
        
        
        projected_path.removeFromParent()
        
        self.backgroundColor = SKColor.black
        let starting_position = grid?.gridPosition(row:  racecar.y_position, col: racecar.x_position)
        
        
        let ending_position = grid?.gridPosition(row:  racecar.y_position - racecar.y_velocity - racecar.y_acceleration, col: racecar.x_position + racecar.x_velocity + racecar.x_acceleration)
        
        let line_path:CGMutablePath = CGMutablePath()
        line_path.move(to: starting_position!)
        line_path.addLine(to: ending_position!)
        
        let angle = atan2((ending_position?.y)! - (starting_position?.y)! , (ending_position?.x)! - (starting_position?.x)!)

        
        let rotate_action = SKAction.rotate(toAngle: angle - 1.5707963267949, duration: 0)
        

        
        
        gamePiece.run(rotate_action)
        print(angle)
        
        
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

    init(size: CGSize, type: String) {
        
        super.init(size: size)
        
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 18))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  36, col: 30))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 28))!)
        
        colors.append(color1)
        colors.append(color2)
        colors.append(color3)
        
        game_type = type
        

        time_between_moves = 1.35

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        if paused_game == false {
            
            if (grid?.size.width)! < 1.5 * original_grid_size.width && (grid?.size.width)! > 0.5 * original_grid_size.width {
                let pinch = SKAction.scale(by: sender.scale, duration: 0.0)
                grid?.run(pinch)
                sender.scale = 1.0
            } else {
                
                if (grid?.size.width)! < 0.5 * original_grid_size.width {
                    let pinch = SKAction.scale(by: 1.02, duration: 0.0)
                    grid?.run(pinch)
                    sender.scale = 1.0
                } else {
                    let pinch = SKAction.scale(by: 0.98, duration: 0.0)
                    grid?.run(pinch)
                    sender.scale = 1.0
                }
            }
        }
    }

    func draw_checkpoint_one(position: CGPoint) {
        checkpoint_one = SKSpriteNode(color: SKColor.red, size: CGSize(width: 200, height: 50))
        checkpoint_one.position = position
        checkpoint_one.alpha = 0.0
        checkpoint_one.name = "checkpoint_one"
        //checkpoint_one.zPosition = 1
        
        checkpoint_one.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 50))
        checkpoint_one.physicsBody?.affectedByGravity = false
        checkpoint_one.physicsBody?.categoryBitMask = physicsCategory.checkpoint_one
        checkpoint_one.physicsBody?.collisionBitMask = 0
        checkpoint_one.physicsBody?.contactTestBitMask = physicsCategory.projected_velocity
        checkpoint_one.physicsBody?.isDynamic = true
        //checkpoint_one.strokeColor = SKColor.red
        
        grid?.addChild(checkpoint_one)
    }

    func draw_checkpoint_two(position: CGPoint) {
        checkpoint_two = SKSpriteNode(color: SKColor.red, size: CGSize(width: 200, height: 50))
        checkpoint_two.position = position
        checkpoint_two.alpha = 0.0
        checkpoint_two.name = "checkpoint_two"
        //checkpoint_one.zPosition = 1
        
        checkpoint_two.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 50))
        checkpoint_two.physicsBody?.affectedByGravity = false
        checkpoint_two.physicsBody?.categoryBitMask = physicsCategory.checkpoint_two
        checkpoint_two.physicsBody?.collisionBitMask = 0
        checkpoint_two.physicsBody?.contactTestBitMask = physicsCategory.projected_velocity
        checkpoint_two.physicsBody?.isDynamic = true
        //checkpoint_one.strokeColor = SKColor.red
        
        grid?.addChild(checkpoint_two)
    }

    func draw_finish_line(position: CGPoint) {
        finish_line = SKSpriteNode(color: SKColor.red, size: CGSize(width: 230, height: 30))
        finish_line.position = position
        //checkpoint_one.alpha = 0.0
        finish_line.name = "finish_line"
        //checkpoint_one.zPosition = 1
        
        finish_line.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 50))
        finish_line.physicsBody?.affectedByGravity = false
        finish_line.physicsBody?.categoryBitMask = physicsCategory.finish_line
        finish_line.physicsBody?.collisionBitMask = 0
        finish_line.physicsBody?.contactTestBitMask = physicsCategory.projected_velocity
        finish_line.physicsBody?.isDynamic = true
        //checkpoint_one.strokeColor = SKColor.red
        
        grid?.addChild(finish_line)
    }
    
    func restart_scene() {
        
//        grid?.removeAllActions()
//        grid?.removeAllChildren()
        
        self.removeAllActions()
        self.removeAllChildren()
        
        create_scene_specs()
        create_scene()
        number_of_moves = 0
        last_checkpoint = 0
        crossing_finish_line = false
    }
    
    
    func create_scene() {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        crossing_finish_line = false
        addChild(audioooo)
        
        
        
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchFrom(_:)))
        self.view?.addGestureRecognizer(pinchGesture)
        
        projected_path.strokeColor = SKColor.green
        
        
        timer.position = CGPoint(x: -375, y: -540)
        timer.zPosition = 20000000
        
        pause.position = CGPoint(x: -self.frame.width /
            2 + 50, y: self.frame.height / 2 - 50)
        pause.zPosition = 9999999
        pause.name = "pause"
        pause.scale(to: CGSize(width: 100, height: 100))
        
        self.addChild(pause)
        
        self.addChild(timer)
        
        number_of_moves_label.text = String(number_of_moves)
        number_of_moves_label.fontSize = 85
        number_of_moves_label.fontName = "Arcade"
        number_of_moves_label.fontColor = SKColor.red
        number_of_moves_label.position = CGPoint(x: self.frame.width / 2 - 90, y: self.frame.height / 2 - 90)
        self.addChild(number_of_moves_label)
        
        
        self.physicsWorld.contactDelegate = self
        
        
        
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
        y_velocity_display.zPosition = 2000000
        
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
        
        UIBackground = SKShapeNode(rectOf: CGSize(width: self.frame.width, height: x_acceleration_button.size.height + timer.size.height * 2))
        
        UIBackground.position =  CGPoint(x: 0, y: -1 * self.frame.height / 2 + 70 )
        UIBackground.fillColor = SKColor.darkGray
        UIBackground.zPosition = 200000
        
        
        
        x_acceleration_button.position = CGPoint(x: -self.frame.width / 12, y: -1 * self.frame.height / 2 + 50)
        x_acceleration_button.zPosition = 2000001
        
        x_deacceleration_button.position = CGPoint(x: self.frame.width / 12 , y: -1 * self.frame.height / 2 + 50)
        x_deacceleration_button.zPosition = 2000001
        
        y_acceleration_button.position = CGPoint(x: self.frame.width / 4, y: -1 * self.frame.height / 2 + 50)
        y_acceleration_button.zPosition = 2000001
        
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 75, y: -1 * self.frame.height / 2 + 50)
        y_deacceleration_button.zPosition = 2000001
        
        
        
        
        
        //        let vroom = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        //        vroom.position = CGPoint(x: 0, y: self.frame.height / 2 - 50)
        //        vroom.name = "vroom"
        
        addChild(UIBackground)
        addChild(x_velocity_display)
        addChild(y_velocity_display)
        addChild(x_acceleration_button)
        addChild(x_deacceleration_button)
        addChild(y_acceleration_button)
        addChild(y_deacceleration_button)
        //self.addChild(vroom)
        
        
        grid?.position = CGPoint(x: -300, y: 0)
        
        grid?.zPosition = 10
        addChild(grid!)
        original_grid_size = (grid?.size)!
        
        
        gamePiece.setScale(0.0625)
        gamePiece.position = (grid?.gridPosition(row:  racecar.y_position, col:  racecar.x_position))!
        gamePiece.zPosition = 2002
        
        
        //        opponentGamePiece.position = (grid?.gridPosition(row:  racecar.y_position - 1, col:  racecar.x_position))!
        //        opponentGamePiece.setScale(0.0625)
        //        opponentGamePiece.zPosition = 2002
        
        
        grid?.addChild(projected_path)
        //grid?.addChild(opponentGamePiece)
        
        let spawn = SKAction.run({
            () in
            self.move()
            
        })
        
        
        let delay = SKAction.wait(forDuration: TimeInterval(time_between_moves))
        
        
        
        let SpawnDelay = SKAction.sequence([spawn, delay])
        
        let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
        self.run(spawnDelayForever, withKey: "key")
        
        for obstacle in obstacles {
            
            
            
            
            
            let diceRoll = Int(arc4random_uniform(UInt32(colors.count)))
            let current_obstacle = SKSpriteNode(color: colors[diceRoll], size: CGSize(width: 30, height: 30))
            current_obstacle.position = (grid?.gridPosition(row:  obstacle.x, col:  obstacle.y))!
            current_obstacle.name = "obstacle"
            
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


    override func didMove(to view: SKView) {
        //UserDefaults.standard.setValue(420, forKey: "GalileoCourseTwo")
        
        create_scene()
        
    }
    
    func create_scene_specs() {
        
    }
    
    func cross_finish_line() {
        
        if last_checkpoint == 2 {
            last_checkpoint = 0
            paused_game = true
            if let action = action(forKey: "key") {
                
                action.speed = 0
                timer.isPaused = true
            }
            
            
            
            let ending_background = SKShapeNode(rectOf: CGSize(width: 500, height: 1000))
            
            ending_background.position = CGPoint(x: 0, y: 0)
            ending_background.zPosition = 999999998
            ending_background.fillColor = SKColor.black
            
            self.addChild(ending_background)
            exit = SKLabelNode(text: "Exit")
            exit.position = CGPoint(x: 0, y: -200)
            exit.fontSize = 100
            exit.fontColor = SKColor.red
            exit.name = "exit"
            exit.zPosition = 999999999
            
            ending_background.addChild(exit)
            
            if game_type == "time_trials" {
            
                
                print("recorded")
            
            
                if let current_high_score = UserDefaults.standard.value(forKey: key) as? Int {
                    if current_high_score > number_of_moves {
                        UserDefaults.standard.setValue(number_of_moves, forKey: key)
                    }
                } else {

                    UserDefaults.standard.setValue(number_of_moves, forKey: key)

                }
            
                
                let score = SKLabelNode(text: "Score: " + String(number_of_moves))
                
                score.position = CGPoint(x: 0, y: 200)
                score.fontSize = 100
                score.fontColor = SKColor.red
                //score.name = "exit"
                score.zPosition = 999999999
                
                ending_background.addChild(score)
                
                let best = UserDefaults.standard.value(forKey: key) as! Int
                
                let best_score = SKLabelNode(text: "High Score: " + String(describing: best))
                
                best_score.position = CGPoint(x: 0, y: 100)
                best_score.fontSize = 80
                best_score.fontColor = SKColor.red
                //score.name = "exit"
                best_score.zPosition = 999999999
                
                ending_background.addChild(best_score)
                
            } else if game_type == "grand_prix" {
                let next = SKLabelNode(text: "Next Course")
                next.position = CGPoint(x: 0, y: 0)
                next.name = "next"
                next.fontSize = 100
                next.fontColor = SKColor.red
                //score.name = "exit"
                next.zPosition = 999999999
                
                ending_background.addChild(next)
            }
        }
        
    }


    func didBegin(_ contact: SKPhysicsContact) {
        
        
        
        
        if contact.bodyA.node?.name == "projected_path" {
            
            if contact.bodyB.node?.name == "obstacle" {
                print("about to crash")
                projected_path.strokeColor = SKColor.red
            }
            
            if contact.bodyB.node?.name == "checkpoint_one" {
                print("checkpoint_one")
//                projected_path.strokeColor = SKColor.red
                
                if last_checkpoint == 0 || last_checkpoint == 2 {
                    last_checkpoint = 1
                    print(last_checkpoint)
                }
            }
            
            if contact.bodyB.node?.name == "checkpoint_two" {
                if last_checkpoint == 1 {
                    last_checkpoint = 2
                    print(last_checkpoint)
                }
            }
            
            if contact.bodyB.node?.name == "finish_line" {
                if last_checkpoint == 2 {
                    crossing_finish_line = true
                }
                
            }
        }
        
    
    
        if contact.bodyB.node?.name == "projected_path" {
    
            if contact.bodyA.node?.name == "obstacle" {
                print("about to crash")
                projected_path.strokeColor = SKColor.red
            }
            
            if contact.bodyA.node?.name == "checkpoint_one" {
                print("checkpoint_one")
                //projected_path.strokeColor = SKColor.red
                if last_checkpoint == 0 {
                    last_checkpoint = 1
                    print(last_checkpoint)
                }
            }
            
            if contact.bodyA.node?.name == "checkpoint_two" {
                print("checkpoint_two")
                if last_checkpoint == 1 {
                    last_checkpoint = 2
                    print(last_checkpoint)
                }
            }
            
            if contact.bodyA.node?.name == "finish_line" {
                if last_checkpoint == 2 {
                    crossing_finish_line = true
                }
                
            }
        }
        
        
        
    }



    func move() {
        
        
        turn_number += 1
        number_of_moves += 1
        number_of_moves_label.text = String(number_of_moves)
        
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
            grid?.addChild(gamePiece)
            
            draw_projected_path()
            
            if crossing_finish_line == true {
                cross_finish_line()
            }
            //grid?.addChild(projected_velocity)
        } else {
            
//            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
//            let menuScene = MenuScene(size: self.size)
//            self.view?.presentScene(menuScene, transition: reveal)
         
            
            if let action = action(forKey: "key") {
                
                action.speed = 0
                timer.isPaused = true
                
                crashed_out.position = CGPoint(x: 0, y: 200)
                crashed_out.fontSize = 100
                crashed_out.fontColor = SKColor.red
                crashed_out.zPosition = 999999999
                
                
                
                crash_background.position = CGPoint(x: 0, y: 0)
                crash_background.zPosition = 999999998
                crash_background.fillColor = SKColor.black
                
                

                crash_restart = SKLabelNode(text: "Restart")
                crash_restart.position = CGPoint(x: 0, y: 0)
                crash_restart.fontSize = 100
                crash_restart.fontColor = SKColor.red
                crash_restart.name = "restart"
                crash_restart.zPosition = 999999999
                
                
                crash_exit = SKLabelNode(text: "Exit")
                crash_exit.position = CGPoint(x: 0, y: -200)
                crash_exit.fontSize = 100
                crash_exit.fontColor = SKColor.red
                crash_exit.name = "exit"
                crash_exit.zPosition = 999999999
                
                paused_game = true
                
                self.addChild(crash_background)
                crash_background.addChild(crashed_out)
                crash_background.addChild(crash_exit)
                crash_background.addChild(crash_restart)
                
            }

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
                if paused_game == false {
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
                
                
                
                if name == "pause"
                {
                    if paused_game == false {
                    
                        if let action = action(forKey: "key") {
                            
                            action.speed = 0
                            timer.isPaused = true
                            
                            pause_background.position = CGPoint(x: 0, y: 0)
                            pause_background.zPosition = 999999998
                            pause_background.fillColor = SKColor.black
                            
                            
                            
                            resume = SKLabelNode(text: "Resume")
                            resume.position = CGPoint(x: 0, y: 200)
                            resume.fontSize = 100
                            resume.fontColor = SKColor.red
                            resume.name = "resume"
                            resume.zPosition = 999999999
                            
                            restart = SKLabelNode(text: "Restart")
                            restart.position = CGPoint(x: 0, y: 0)
                            restart.fontSize = 100
                            restart.fontColor = SKColor.red
                            restart.name = "restart"
                            restart.zPosition = 999999999
                            
                            
                            exit = SKLabelNode(text: "Exit")
                            exit.position = CGPoint(x: 0, y: -200)
                            exit.fontSize = 100
                            exit.fontColor = SKColor.red
                            exit.name = "exit"
                            exit.zPosition = 999999999
                            
                            paused_game = true
                            
                            self.addChild(pause_background)
                            pause_background.addChild(resume)
                            pause_background.addChild(exit)
                            pause_background.addChild(restart)
                            
                        }
                    }
                    
                }
                
                if name == "resume"
                {
                    
                    if let action = action(forKey: "key") {
                        
                        action.speed = 1
                        timer.isPaused = false
                        
                        paused_game = false
                        
                        pause_background.removeFromParent()
//                        resume.removeFromParent()
//                        exit.removeFromParent()
                    }
                    
                }
                
                if name == "restart"
                {
                    
                    if let action = action(forKey: "key") {
                        
                        action.speed = 1
                        timer.isPaused = false
                        
                        paused_game = false
                        
                        pause_background.removeFromParent()
                        //                        resume.removeFromParent()
                        //                        exit.removeFromParent()
                    }
                    
                    restart_scene()
                    
                }
                
                if name == "exit"
                {
                    
                    let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                    let menuScene = MenuScene(size: self.size)
                    self.view?.presentScene(menuScene, transition: reveal)
                    
                }
            }
        }
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            
            
            if paused_game == false {
                //Get the current position in scene of the touch.
                let location = touch.location(in: view)
                //Get the previous position in scene of the touch.
                let previousLocation = touch.previousLocation(in: view)
                //Calculate the translation.
                //let translation = CGPoint((location.x - previousLocation.x), (location.y - previousLocation.y))
                
                var x_translation = location.x - previousLocation.x
                var y_translation = location.y - previousLocation.y
                //Get the current position in scene of the crossHair.
                let position = grid?.position
                // Get the bode touched
                //var body = self.nodeAtPoint(location)
                
                
                if Int((grid?.position.x)!) > 500 {
                    x_translation = -1
                }
                
                if Int((grid?.position.x)!) < -500 {
                    x_translation = 1
                }
                
                if Int((grid?.position.y)!) > 500 {
                    y_translation = 1
                }
                
                if Int((grid?.position.y)!) < -500 {
                    y_translation = -1
                }
                
                
                
                grid?.position = CGPoint(x: ((position?.x)! + x_translation * 2), y: ( (position?.y)! - y_translation * 2) )
                
            }
            
            
            
            
            //Set the position of the crosshair to its current position plus the translation.
            //grid?.position = CGPoint(x: ((position?.x)! + x_translation * 2), y: ( (position?.y)! + y_translation * 2) )
            //Set the position of the body
            //body.position = location
            
        }
    }



    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        //x_velocity_display.color = SKColor.red
        
        print(game_type)
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
