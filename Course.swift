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
import SAConfettiView
import AudioToolbox
import UIKit


class Course: SKScene, SKPhysicsContactDelegate {


    let x_acceleration_button = SKSpriteNode(imageNamed: "right_red")

    let x_deacceleration_button = SKSpriteNode(imageNamed: "left_red")


    let y_acceleration_button = SKSpriteNode(imageNamed: "up_red")

    let y_deacceleration_button = SKSpriteNode(imageNamed: "down_red")
    
    var UIBackground = SKShapeNode(rectOf: CGSize(width: 250 , height: 250))
    var speedometerUIBackground = SKShapeNode(rectOf: CGSize(width: 250 , height: 250))

    var gameDifficulty = String()


    var racecar = Racecar(x_pos: 29, y_pos: 20)

    let x_velocity_display = SKLabelNode()
    let y_velocity_display = SKLabelNode()

    var grid = Grid(blockSize: CGFloat(35.0), rows:42, cols:32)
    let gamePiece = SKSpriteNode(imageNamed: "red_car")

    let projected_velocity = SKSpriteNode(imageNamed: "red")
    let vroom = SKSpriteNode(imageNamed: "red")

    var obstacles:[(x: Int, y: Int)] = []
    var available_moves:[(x: Int, y: Int)] = []

    var bot_path:[(x: Int, y: Int)] = []

    var previous_locations = [SKShapeNode]()
    var available_locations:[(x: Int, y: Int)] = []
    
    var obstacles_nodes = [SKSpriteNode]()
    
    var available_moves_nodes = [SKSpriteNode]()

    let projected_path = SKShapeNode()

    let timer = SKSpriteNode(color: SKColor.white , size: CGSize(width: 30, height: 30))

    var time_between_moves = CGFloat()

    var turn_number = 0

    var finish_line = SKSpriteNode()

    var checkpoint_one = SKSpriteNode()
    
    var checkpoint_two = SKSpriteNode()

    var last_checkpoint = 0
    
    let pause_background = SKShapeNode(rectOf: CGSize(width: 650, height: 1100))
    let crash_background = SKShapeNode(rectOf: CGSize(width: 650, height: 1100))

    var number_of_moves = 0
    
    var number_of_moves_label = SKLabelNode()
    let number_of_moves_label_background = SKSpriteNode(color: SKColor.darkGray, size: CGSize(width: 320, height: 70) )
    
    
    var key = "GalileoCourseOne"
    
    var original_grid_size = CGSize()
    
    let pause = SKSpriteNode(imageNamed: "pause_button")
    
    var resume = SKLabelNode()
    
    
    var restart = SKLabelNode()
    
    var crashed_out = SKLabelNode(text: "Crashed Out")
    
    var crash_restart = SKLabelNode()
    var exit = SKLabelNode()
    var crash_exit = SKLabelNode()

    var paused_game = false
    var crossing_finish_line = false
    
    var game_type = String()
    var cup_membership = String()
    
    
    var audioooo = SKAudioNode(fileNamed: "Bloodrocuted")
    
    var confettiView = SAConfettiView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    var colors = [UIColor]()
    var color1 = UIColor(red: 255/255, green: 230/255, blue: 109/255, alpha: 1.0)
    var color2 = UIColor(red: 47/255, green: 48/255, blue: 97/255, alpha: 1.0)
    var color3 = UIColor(red: 247/255, green: 255/255, blue: 247/255, alpha: 1.0)
    
    var par = 0
    
    var remaining_lives = 0
    
    var last_course_in_cup = false
    
    
    var starting_move_number = 0
    
    let speedometer = SKSpriteNode(imageNamed: "Counter_01")
    let speedometer_pin = SKSpriteNode(imageNamed: "Needle_01")
    
    
    
    func pause_music() {
        let pause_music = SKAction.pause()
        audioooo.run(pause_music)
    }
    
    
    func resume_music() {
        let resume_music = SKAction.play()
        audioooo.run(resume_music)
    }
    
    func draw_available_moves() {
        
        
        for available_move in available_moves_nodes {
            available_move.removeFromParent()
        }
        
        build_available_moves(x: racecar.x_position + racecar.x_velocity + racecar.x_acceleration  , y: racecar.y_position  - racecar.y_velocity - racecar.y_acceleration )
        for i in 0...8 {
            
            let current_node = SKSpriteNode(color: SKColor.green , size: CGSize(width: 30, height: 30))
            current_node.position = (grid?.gridPosition(row:  available_moves[i].y , col: available_moves[i].x ))!
            // this zposition is just here to force it to go underneath the obstacles
            current_node.zPosition = 49
            current_node.alpha = 0.25
            current_node.name = "available_move"
            
            available_moves_nodes.append(current_node)
            grid?.addChild(current_node)
        }
        
    }
    
    
    func build_available_moves(x: Int, y: Int) {
        // probably a smarter way to do this but theres ony nine
        available_moves = []
        
        available_moves.append( (x: x - 1, y: y + 1) )
        available_moves.append( (x: x, y: y + 1) )
        available_moves.append( (x: x + 1, y: y + 1) )

        available_moves.append( (x: x - 1, y: y) )
        available_moves.append( (x: x, y: y) )
        available_moves.append( (x: x + 1, y: y) )
        
        available_moves.append( (x: x - 1, y: y - 1) )
        available_moves.append( (x: x, y: y - 1) )
        available_moves.append( (x: x + 1, y: y - 1) )


        
    }
    
    func draw_projected_path() {
        
        
        projected_path.removeFromParent()
        
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

    init( type: String, previous_move_count: Int, number_of_lives: Int) {
        
        super.init(size: CGSize(width: 750, height: 1334))
        
        number_of_moves = previous_move_count
        starting_move_number = previous_move_count
        remaining_lives = number_of_lives
        
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 18))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  36, col: 30))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 28))!)
        
        colors = [ blue, yellow, red ]
        
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
        shape.strokeColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        shape.lineWidth = 2
        
        previous_locations.append(shape)
        grid?.addChild(shape)
    }
    
    func repaint_previous_locations() {
        
        
        for prev_loc in previous_locations {
            prev_loc.strokeColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        }
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
        finish_line = SKSpriteNode(color: SKColor.red, size: CGSize(width: 250, height: 20))
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
        
        grid?.removeAllActions()
        grid?.removeAllChildren()
        
        
        speedometer.removeAllActions()
        speedometer.removeAllChildren()
        
        crash_background.removeAllActions()
        crash_background.removeAllChildren()
        
        self.removeAllActions()
        self.removeAllChildren()
        
        if game_type == "time_trials" {
            number_of_moves = 0
        }
        create_scene_specs()
        create_scene()
        
        last_checkpoint = 0
        crossing_finish_line = false
    }
    
    func repaint_obstacles() {
        
        for obstacle in obstacles_nodes {
            obstacle.color = colors[ Int(arc4random_uniform(UInt32(colors.count))) ]
        }
        
    }
    
    func move_speedometer_pin(speed: Double) {
        
        
        let starting_angle = ((41.0 / 34.0) * 3.1415) - 1.57079
        let angle = starting_angle - ( (speed * ( 1.0 / 7.0 )) * 3.1415   )
        let rotate = SKAction.rotate(toAngle: CGFloat(angle), duration: 0.1)
        speedometer_pin.run(rotate)
    }
    
    func drop_confetti() {
        
        
        confettiView = SAConfettiView(frame: (self.view?.bounds)!)
        confettiView.type = .Diamond
        confettiView.colors = colors
        self.view?.addSubview(confettiView)
        confettiView.startConfetti()
        
    }
    
    
    func create_scene() {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 750, height: 1334)
        self.backgroundColor = SKColor.black
        crossing_finish_line = false
        addChild(audioooo)
        
//        let lucio = SKAction.playSoundFileNamed("bloodrocuted", waitForCompletion: false)
//        run(lucio)
//        let pause_lucio = SKAction.pause()
//      
        
        addChild(speedometer)
        speedometer_pin.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        speedometer.addChild(speedometer_pin)
        
        let rotate = SKAction.rotate(toAngle: ((41.0 / 34.0) * 3.1415) - 1.57079 , duration: 0)
        speedometer_pin.run(rotate)

        
        speedometer.position = CGPoint(x: -1 * self.frame.width / 2 + 125  ,y: -1 * self.frame.height / 2 + 225)
        speedometer.scale(to: CGSize(width: 225 , height: 225))
        speedometer.zPosition = 200001
        
        
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchFrom(_:)))
        self.view?.addGestureRecognizer(pinchGesture)
        
        projected_path.strokeColor = SKColor.green
        
        
        //timer.position = CGPoint(x: -375, y: -440)
        timer.position = CGPoint(x: 0, y: -1 * self.frame.height / 2 + 225)
        
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
        number_of_moves_label.fontColor = red
        number_of_moves_label.position = CGPoint(x: self.frame.width / 2 - 190, y: self.frame.height / 2 - 90)
        number_of_moves_label.zPosition = 20000000
        self.addChild(number_of_moves_label)
        
        

        number_of_moves_label_background.position = CGPoint(x: self.frame.width / 2 - 190, y: self.frame.height / 2 - 50)
        
        number_of_moves_label_background.zPosition = 20000001
        self.addChild(number_of_moves_label_background)
        
        
        self.physicsWorld.contactDelegate = self
        
        
        
        x_velocity_display.text = "0"
        x_velocity_display.fontSize = 65
        x_velocity_display.fontColor = SKColor.white
        
        y_velocity_display.text = "0"
        y_velocity_display.fontSize = 65
        y_velocity_display.fontColor = SKColor.white
        
        //these z positions should always be the highest
        
        x_velocity_display.position =  CGPoint(x: -self.frame.width / 2 + 50, y: -1 * self.frame.height / 2 + 150)
        x_velocity_display.zPosition = 2000000
        
        y_velocity_display.position = CGPoint(x: -self.frame.width / 4, y: -1 * self.frame.height / 2 + 150)
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
        
//        UIBackground = SKShapeNode(rectOf: CGSize(width: self.frame.width, height: x_acceleration_button.size.height + timer.size.height * 2))
        
        UIBackground.position =  CGPoint(x: self.frame.width / 2 - 125  ,y: -1 * self.frame.height / 2 + 225)
        //UIBackground.position = CGPoint(x: 0, y: 0)
        UIBackground.fillColor = SKColor.darkGray
        UIBackground.zPosition = 200000
        
        speedometerUIBackground.position =  CGPoint(x: -1 * self.frame.width / 2 + 125  ,y: -1 * self.frame.height / 2 + 225)
        //UIBackground.position = CGPoint(x: 0, y: 0)
        speedometerUIBackground.fillColor = SKColor.darkGray
        speedometerUIBackground.zPosition = 200000
        
        x_acceleration_button.position = CGPoint(x: self.frame.width / 2 - 40, y: -1 * self.frame.height / 2 + 225)
        x_acceleration_button.zPosition = 2000001
        
        x_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 210 , y: -1 * self.frame.height / 2 + 225)
        x_deacceleration_button.zPosition = 2000001
        
        y_acceleration_button.position = CGPoint(x: self.frame.width / 2 - 125, y: -1 * self.frame.height / 2 + 310)
        y_acceleration_button.zPosition = 2000001
        
        y_deacceleration_button.position = CGPoint(x: self.frame.width / 2 - 125, y: -1 * self.frame.height / 2 + 140)
        y_deacceleration_button.zPosition = 2000001
        
        
        
        
        
        //        let vroom = SKSpriteNode(color: SKColor.red, size: CGSize(width: 90, height: 90))
        //        vroom.position = CGPoint(x: 0, y: self.frame.height / 2 - 50)
        //        vroom.name = "vroom"
        addChild(speedometerUIBackground)
        addChild(UIBackground)
//        addChild(x_velocity_display)
//        addChild(y_velocity_display)
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
            
            current_obstacle.zPosition = 50
            
            current_obstacle.name = "obstacle"
            
            current_obstacle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 30))
            current_obstacle.physicsBody?.categoryBitMask = physicsCategory.obstacle
            current_obstacle.physicsBody?.collisionBitMask = 0
            current_obstacle.physicsBody?.contactTestBitMask = physicsCategory.projected_velocity
            current_obstacle.physicsBody?.isDynamic = true
            //current_obstacle.physicsBody?.pinned = true
            
            current_obstacle.physicsBody?.affectedByGravity = false
            
            
            grid?.addChild(current_obstacle)
            
            obstacles_nodes.append(current_obstacle)
            
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
        
        
        pause_music()
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
            exit.fontName = "Arcade"
            exit.fontColor = red
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
                score.fontName = "Arcade"
                score.fontColor = SKColor.red
                //score.name = "exit"
                score.zPosition = 999999999
                
                ending_background.addChild(score)
                
                let best = UserDefaults.standard.value(forKey: key) as! Int
                
                if number_of_moves <= best && game_type == "time_trials" {
                    drop_confetti()
                    
                }
                
                
                
                let best_score = SKLabelNode(text: "High Score: " + String(describing: best))
                
                best_score.position = CGPoint(x: 0, y: 100)
                best_score.fontSize = 80
                best_score.fontName = "Arcade"
                best_score.fontColor = SKColor.red
                //score.name = "exit"
                best_score.zPosition = 999999999
                
                ending_background.addChild(best_score)
                
            } else if game_type == "grand_prix" {
                
                if last_course_in_cup == false {
                    let next = SKLabelNode(text: "Next")
                    next.position = CGPoint(x: 0, y: 0)
                    next.name = "next"
                    next.fontName = "Arcade"
                    next.fontSize = 100
                    next.fontColor = red
                    //score.name = "exit"
                    next.zPosition = 999999999
                    
                    ending_background.addChild(next)
                    
                } else {
                    
                    
                    if number_of_moves < TrophySystem.cup_par_values()[cup_membership]! {
                        
                        
                        UserDefaults.standard.setValue(true, forKey: key + "Gold")
                        drop_confetti()
                        
                        let next = SKLabelNode(text: "Gold medal!!")
                        next.position = CGPoint(x: 0, y: 0)
                        //next.name = "next"
                        next.fontSize = 100
                        next.fontName = "Arcade"
                        next.fontColor = SKColor.red
                        //score.name = "exit"
                        next.zPosition = 999999999
                        
                        ending_background.addChild(next)
                    } else {
                        
                        
                        let next = SKLabelNode(text: "Over Par")
                        next.position = CGPoint(x: 0, y: 0)
                        //next.name = "next"
                        next.fontSize = 100
                        next.fontName = "Arcade"
                        next.fontColor = SKColor.red
                        //score.name = "exit"
                        next.zPosition = 999999999
                        
                        ending_background.addChild(next)
                        
                        
                    }
                    
                    
                    
                }
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
        
        
        //turn_number += 1
        number_of_moves += 1
        
        if game_type == "time_trials" {
            
            
            
            let course_par = TrophySystem.par_values()[key]!
            var best_score = course_par
            
            
            if let high = UserDefaults.standard.value(forKey: key) as! Int! {
                
                
            
            
                if high < course_par {
                    
                    best_score = high
                }
                
            }
            
            number_of_moves_label.text = String(number_of_moves) + "/" + String(describing: best_score)
            
            
        } else {
            
            let best_score = TrophySystem.cup_par_values()[cup_membership]
            
            number_of_moves_label.text = String(number_of_moves) + "/" + String(describing: best_score!)
        }
        
        
        
        
        if projected_path.strokeColor == SKColor.green {
            
            timer.removeAllActions()
            timer.size = CGSize(width: 0, height: 0)
            
            repaint_obstacles()
            repaint_previous_locations()
            let timing = SKAction.resize(toWidth: 250, duration: TimeInterval(time_between_moves))
            let timing_height = SKAction.resize(toHeight: 250, duration: TimeInterval(time_between_moves))
            
            timer.run(timing)
            timer.run(timing_height)
            
            let starting_point = (grid?.gridPosition(row:  racecar.y_position , col: racecar.x_position))!
            
            
            let starting_x_position = Int(starting_point.x)
            let starting_y_position = Int(starting_point.y)
            
            
            
            let previous_location_node = SKSpriteNode(color: SKColor.white, size: CGSize(width: 10, height: 10))
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
            draw_available_moves()
            if crossing_finish_line == true {
                cross_finish_line()
            }
            //grid?.addChild(projected_velocity)
        } else {
            
            // WIPE OUT
            
//            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
//            let menuScene = MenuScene(size: self.size)
//            self.view?.presentScene(menuScene, transition: reveal)
         
            pause_music()
            if let action = action(forKey: "key") {
                
                action.speed = 0
                timer.isPaused = true
                
                if game_type == "time_trials" {
                
                    crashed_out.position = CGPoint(x: 0, y: 200)
                    crashed_out.fontSize = 100
                    crashed_out.fontName = "Arcade"
                    crashed_out.fontColor = red
                    crashed_out.zPosition = 999999999
                    
                    
                    
                    crash_background.position = CGPoint(x: 0, y: 0)
                    crash_background.zPosition = 999999998
                    crash_background.fillColor = SKColor.black
                    
                    

                    crash_restart = SKLabelNode(text: "Restart")
                    crash_restart.position = CGPoint(x: 0, y: 0)
                    crash_restart.fontSize = 100
                    crash_restart.fontName = "Arcade"
                    crash_restart.fontColor = blue
                    crash_restart.name = "restart"
                    crash_restart.zPosition = 999999999
                    
                    
                    crash_exit = SKLabelNode(text: "Exit")
                    crash_exit.position = CGPoint(x: 0, y: -200)
                    crash_exit.fontSize = 100
                    crash_exit.fontName = "Arcade"
                    crash_exit.fontColor = blue
                    crash_exit.name = "exit"
                    crash_exit.zPosition = 999999999
                    
                    paused_game = true
                    
                    self.addChild(crash_background)
                    crash_background.addChild(crashed_out)
                    crash_background.addChild(crash_exit)
                    crash_background.addChild(crash_restart)
                    
                } else {
                    
                    remaining_lives -= 1
                    
                    if remaining_lives > 0 {
                        
                        
                        crashed_out.position = CGPoint(x: 0, y: 300)
                        crashed_out.fontSize = 100
                        crashed_out.fontName = "Arcade"
                        crashed_out.fontColor = red
                        crashed_out.zPosition = 999999999
                        
                        
                        
                        crash_background.position = CGPoint(x: 0, y: 0)
                        crash_background.zPosition = 999999998
                        crash_background.fillColor = SKColor.black
                        
                        
                        let remaining_lives_label = SKLabelNode(text: "Remaining lives: " + String(remaining_lives))
                        remaining_lives_label.position = CGPoint(x: 0, y: 125)
                        remaining_lives_label.fontSize = 70
                        remaining_lives_label.fontName = "Arcade"
                        remaining_lives_label.fontColor = blue
                        remaining_lives_label.name = "restart"
                        remaining_lives_label.zPosition = 999999999
                        
                        
                        crash_restart = SKLabelNode(text: "Restart")
                        crash_restart.position = CGPoint(x: 0, y: -150)
                        crash_restart.fontSize = 100
                        crash_restart.fontName = "Arcade"
                        crash_restart.fontColor = blue
                        crash_restart.name = "restart"
                        crash_restart.zPosition = 999999999
                        
                        
                        crash_exit = SKLabelNode(text: "Exit")
                        crash_exit.position = CGPoint(x: 0, y: -300)
                        crash_exit.fontSize = 100
                        crash_exit.fontName = "Arcade"
                        crash_exit.fontColor = blue
                        crash_exit.name = "exit"
                        crash_exit.zPosition = 999999999
                        
                        paused_game = true
                        
                        self.addChild(crash_background)
                        crash_background.addChild(remaining_lives_label)
                        crash_background.addChild(crashed_out)
                        crash_background.addChild(crash_exit)
                        crash_background.addChild(crash_restart)
                        
                        
                    } else {
                        
                        crashed_out.position = CGPoint(x: 0, y: 200)
                        crashed_out.text = "Game Over"
                        crashed_out.fontSize = 100
                        crashed_out.zPosition = 999999999
                        
                        
                        
                        crash_background.position = CGPoint(x: 0, y: 0)
                        crash_background.zPosition = 999999998
                        crash_background.fillColor = SKColor.black
                        
                        
                        
                        
                        
                        crash_exit = SKLabelNode(text: "Exit")
                        crash_exit.position = CGPoint(x: 0, y: -200)
                        crash_exit.fontSize = 100
                        crash_exit.fontName = "Arcade"
                        crash_exit.fontColor = blue
                        crash_exit.name = "exit"
                        crash_exit.zPosition = 999999999
                        
                        paused_game = true
                        
                        self.addChild(crash_background)
                        crash_background.addChild(crashed_out)
                        crash_background.addChild(crash_exit)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                
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
                            
                            let generator = UIImpactFeedbackGenerator(style: .heavy )
                            generator.impactOccurred()
                            
                            racecar.x_acceleration += 1
                            
                            draw_projected_path()
                            move_speedometer_pin(speed: racecar.projected_speed())
                        }
                    
                    }
                        
                    else if name == "x_deacceleration_button"
                    {
                        
                        if racecar.x_acceleration > -1 {
                            
                            let generator = UIImpactFeedbackGenerator(style: .heavy )
                            generator.impactOccurred()
                            
                            racecar.x_acceleration -= 1
                            move_speedometer_pin(speed: racecar.projected_speed())
                            draw_projected_path()
                            
                        }
                    }
                        
                    else if name == "y_acceleration_button"
                    {
                        
                        if racecar.y_acceleration < 1 {
                            
                            let generator = UIImpactFeedbackGenerator(style: .heavy )
                            generator.impactOccurred()
                            
                            racecar.y_acceleration += 1
                            move_speedometer_pin(speed: racecar.projected_speed())
                            draw_projected_path()
                            
                        }
                    }
                        
                    else if name == "y_deacceleration_button"
                    {
                        
                        if racecar.y_acceleration > -1 {
                            
                            
                            let generator = UIImpactFeedbackGenerator(style: .heavy )
                            generator.impactOccurred()
                            
                            racecar.y_acceleration -= 1
                            move_speedometer_pin(speed: racecar.projected_speed())
                            draw_projected_path()
                            
                        }
                    }
                }
                
                
                
                if name == "pause"
                {
                    
                    if paused_game == false {
                        pause_music()
                        if let action = action(forKey: "key") {
                            
                            action.speed = 0
                            timer.isPaused = true
                            
                            pause_background.position = CGPoint(x: 0, y: 0)
                            pause_background.zPosition = 999999998
                            pause_background.fillColor = SKColor.black
                            
                            
                            
                            resume = SKLabelNode(text: "Resume")
                            resume.position = CGPoint(x: 0, y: 200)
                            resume.fontName = "Arcade"
                            resume.fontSize = 150
                            resume.fontColor = blue
                            resume.name = "resume"
                            resume.zPosition = 999999999
                            
                            restart = SKLabelNode(text: "Restart")
                            restart.position = CGPoint(x: 0, y: 0)
                            restart.fontName = "Arcade"
                            restart.fontSize = 150
                            restart.fontColor = blue
                            restart.name = "restart"
                            restart.zPosition = 999999999
                            
                            
                            exit = SKLabelNode(text: "Exit")
                            exit.position = CGPoint(x: 0, y: -200)
                            exit.fontName = "Arcade"
                            exit.fontSize = 125
                            exit.fontColor = blue
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
                    resume_music()
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
                    confettiView.stopConfetti()
                    if let action = action(forKey: "key") {
                        
                        action.speed = 1
                        timer.isPaused = false
                        
                        paused_game = false
                        
                        
                        //                        resume.removeFromParent()
                        //                        exit.removeFromParent()
                    }
                    
                    if game_type == "grand_prix" {
                        number_of_moves = starting_move_number
                    }
                    pause_background.removeFromParent()
                    crash_background.removeFromParent()
                    restart_scene()
                    
                }
                
                if name == "exit"
                {
                    confettiView.stopConfetti()
                    let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                    let menuScene = MenuScene(size: self.size)
                    self.view?.presentScene(menuScene, transition: reveal)
                    
                }
                
                if name == "next"
                {
                    confettiView.stopConfetti()
                    
                    if key == "GalileoCourseOne" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        //let gameScene = GalileoCourseTwo(size: CGSize(width: 750, height: 1334), type: self.game_type)
                        let gameScene = GalileoCourseTwo( type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "GalileoCourseTwo" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = GalileoCourseThree( type: self.game_type , previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "GalileoCourseThree" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = GalileoCourseFour(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "GalileoCourseFour" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let menuScene = MenuScene(size: self.size)
                        self.view?.presentScene(menuScene, transition: reveal)
                    }
                    if key == "NewtonCourseOne" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = NewtonCourseTwo(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "NewtonCourseTwo" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = NewtonCourseThree(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "NewtonCourseThree" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = NewtonCourseFour(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "NewtonCourseFour" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let menuScene = MenuScene(size: self.size)
                        self.view?.presentScene(menuScene, transition: reveal)
                    }
                    if key == "EinsteinCourseOne" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = EinsteinCourseTwo(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "EinsteinCourseTwo" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = EinsteinCourseThree(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "EinsteinCourseThree" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let gameScene = EinsteinCourseFour(type: self.game_type, previous_move_count: number_of_moves, number_of_lives: remaining_lives)
                        self.view?.presentScene(gameScene, transition: reveal)
                    }
                    if key == "EinsteinCourseFour" {
                        let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.25)
                        let menuScene = MenuScene(size: self.size)
                        self.view?.presentScene(menuScene, transition: reveal)
                    }
                    
                    
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
