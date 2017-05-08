//
//  NewtonCourseThree.swift
//  racecar
//
//  Created by Walters Mitch on 4/9/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class NewtonCourseFour: Course {

    
    
    override func create_scene_specs() {
        
        audioooo = SKAudioNode(fileNamed: "08AWellWorkedAnalogy")
        grid = Grid(blockSize: CGFloat(35.0), rows: 42, cols: 30)
        grid?.position = CGPoint(x: -300, y: 0)
        racecar = Racecar(x_pos: 27, y_pos: 22)
        self.key = "NewtonCourseFour"
        cup_membership = "Newton"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  8, col: 10))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  36, col: 6))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  21, col: 26))!)
        obstacles = []
        
        last_course_in_cup = true
        
//        colors = [
//            UIColor(red: 164/255, green: 14/255, blue: 76/255, alpha: 1.0),
//            UIColor(red: 44/255, green: 44/255, blue: 84/255, alpha: 1.0),
//            UIColor(red: 172/255, green: 195/255, blue: 166/255, alpha: 1.0)
//        ]
        
        //1
        for j in 3...14{
            
            for i in 5...9 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //2
        for j in 2...20{
            
            for i in 12...13{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //3
        for j in 7...16{
            
            for i in 18...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //4
        for j in 15...25{
            
            for i in 9...9{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //5
        for j in 21...23{
            
            for i in 12...18{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //6
        for j in 17...25{
            
            for i in 22...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //7
        for j in 26...37{
            
            for i in 9...10{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 26...28{
            
            for i in 11...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //9
        for j in 29...36{
            
            for i in 21...23{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //10
        for j in 33...40{
            
            for i in 14...16{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //11
        for j in 20...41{
            
            for i in 0...5{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //12
        for j in 0...19{
            
            for i in 0...1{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //13
        for j in 0...1{
            
            for i in 0...30{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //14
        for j in 2...36{
            
            for i in 29...30{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //15
        for j in 37...41 {
            
            for i in 26...30{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //16
        for j in 41...41{
            
            for i in 6...25 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        

    }
    
    override func didMove(to view: SKView) {
        
        
        create_scene_specs()
        super.didMove(to: view)
        
    }

    
}
