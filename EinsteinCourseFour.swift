//
//  EinsteinCourseFour.swift
//  racecar
//
//  Created by Walters Mitch on 4/9/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class EinsteinCourseFour: Course {

    
    
    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "The Gears")
        grid = Grid(blockSize: CGFloat(35.0), rows: 51, cols: 38)
        racecar = Racecar(x_pos: 34, y_pos: 41)
        self.key = "EinsteinCourseFour"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  5, col: 1))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  47, col: 1))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  40, col: 34))!)
        obstacles = []
        
        
        last_course_in_cup = true
        
//        colors = [
//            UIColor(red: 233/255, green: 217/255, blue: 133/255, alpha: 1.0),
//            UIColor(red: 116/255, green: 156/255, blue: 117/255, alpha: 1.0),
//            UIColor(red: 93/255, green: 74/255, blue: 102/255, alpha: 1.0)
//        ]]
        
            
        colors = [
            UIColor(red: 8/255, green: 103/255, blue: 136/255, alpha: 1.0),
            UIColor(red: 240/255, green: 200/255, blue: 8/255, alpha: 1.0),
            UIColor(red: 221/255, green: 28/255, blue: 26/255, alpha: 1.0)
        ]
        
        
        //1
        for j in 4...6{
            
            for i in 3...13{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //2
        for j in 4...23{
            
            for i in 14...15{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //3
        for j in 4...4{
            
            for i in 16...35{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //4
        for j in 9...10{
            
            for i in 1...11{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //5
        for j in 6...18{
            
            for i in 18...19{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //6
        for j in 6...7{
            
            for i in 20...36{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //7
        for j in 13...14{
            
            for i in 3...13{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 12...13{
            
            for i in 24...30{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //9
        for j in 17...18{
            
            for i in 1...11{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //10
        for j in 17...18{
            
            for i in 20...25{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //11
        for j in 21...23{
            
            for i in 3...13 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //12
        for j in 22...23{
            
            for i in 16...28{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //13
        for j in 26...28{
            
            for i in 1...26{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //14
        for j in 30...30{
            
            for i in 2...28 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //15
        for j in 32...32{
            
            for i in 1...26{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //16
        for j in 34...34{
            
            for i in 2...28 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //17
        for j in 36...36{
            
            for i in 1...26{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //18
        for j in 38...39{
            
            for i in 5...28{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //19
        for j in 38...47{
            
            for i in 2...4{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //20
        for j in 41...49{
            
            for i in 7...8{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //21
        for j in 40...46{
            
            for i in 11...12 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //22
        for j in 42...49{
            
            for i in 15...16{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //23
        for j in 41...41{
            
            for i in 15...22{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //24
        for j in 44...47{
            
            for i in 19...28{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //25
        for j in 14...47{
            
            for i in 29...30{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //26
        for j in 0...0{
            
            for i in 0...37{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //27
        for j in 1...49{
            
            for i in 37...37{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //28
        for j in 50...50{
            
            for i in 0...37{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //29
        for j in 1...49{
            
            for i in 0...0 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        
    }
    
    override func didMove(to view: SKView) {
        
        create_scene_specs()
        super.didMove(to: view)
        
    }
    
    

}
