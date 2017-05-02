//
//  GalileoCourse.swift
//  racecar
//
//  Created by Walters Mitch on 4/9/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics
class GalileoCourseFour: Course {
    
    

    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "Bloodrocuted")
        grid = Grid(blockSize: CGFloat(35.0), rows: 37, cols: 22)
        grid?.position = CGPoint(x: -300, y: 0)
        racecar = Racecar(x_pos: 19, y_pos: 15)
        self.key = "GalileoCourseFour"
        cup_membership = "Galileo"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  6, col: 11))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  30, col: 11))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  14, col: 19))!)
        
        
        last_course_in_cup = true
        
//        colors = [
//            UIColor(red: 72/255, green: 172/255, blue: 240/255, alpha: 1.0),
//            UIColor(red: 89/255, green: 66/255, blue: 54/255, alpha: 1.0),
//            UIColor(red: 255/255, green: 165/255, blue: 82/255, alpha: 1.0)
//        ]
        
        obstacles = []
        
        //1
        for j in 2...8{
            
            for i in 2...9 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //2
        for j in 11...12{
            
            for i in 6...12{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //3
        for j in 15...22{
            
            for i in 2...9{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //4
        for j in 25...26{
            
            for i in 6...12{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //5
        for j in 29...35{
            
            for i in 2...9{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //6
        for j in 5...32{
            
            for i in 13...17 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //7
        for j in 0...1{
            
            for i in 0...22{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 2...35{
            
            for i in 22...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //9
        for j in 36...37{
            
            for i in 0...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //10
        for j in 2...35{
            
            for i in 0...1{
                
                obstacles.append(x: j, y: i)
                
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        
        create_scene_specs()
        super.didMove(to: view)
        
    }

    
    
    
}
