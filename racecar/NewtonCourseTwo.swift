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
    static let checkpoint_one: UInt32 = 0x1 << 3
    static let checkpoint_two: UInt32 = 0x1 << 4
    static let finish_line: UInt32 = 0x1 << 5
    
    
    //    static let Ground : UInt32 = 0x1 << 2
    //    static let Wall : UInt32 = 0x1 << 3
}


var rows = 42
var cols = 32
var block_size = CGFloat(35.0)


class NewtonCourseTwo: Course {
    

    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "Dethharmonic")
        grid = Grid(blockSize: CGFloat(35.0), rows:42, cols:32)
        racecar = Racecar(x_pos: 29, y_pos: 20)
        self.key = "NewtonCourseTwo"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 18))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  36, col: 30))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 28))!)
        
        colors = [
            UIColor(red: 164/255, green: 14/255, blue: 76/255, alpha: 1.0),
            UIColor(red: 44/255, green: 44/255, blue: 84/255, alpha: 1.0),
            UIColor(red: 172/255, green: 195/255, blue: 166/255, alpha: 1.0)
        ]
        
        obstacles = []
        
        
        //1
        for j in 20...25{
            
            for i in 5...15 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //2
        for j in 12...16{
            
            for i in 0...11 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //3
        for j in 5...8{
            
            for i in 9...15 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //4
        
        for j in 5...25{
            
            for i in 16...24 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //5
        for j in 12...25{
            
            for i in 25...30 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //6
        for j in 5...16{
            
            for i in 31...38 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //7
        for j in 24...27{
            
            for i in 31...38 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //8
        for j in 0...8{
            
            for i in 27...28 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //9
        for j in 19...20{
            
            for i in 35...41 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
    }
    
    override func didMove(to view: SKView) {
        create_scene_specs()
        super.didMove(to: view)
        
    }
    

    
}
