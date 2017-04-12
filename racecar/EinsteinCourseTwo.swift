//
//  EinsteinCourseTwo.swift
//  racecar
//
//  Created by Walters Mitch on 4/6/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class EinsteinCourseTwo: Course {
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        audioooo = SKAudioNode(fileNamed: "Murmaider II The Water God")
        grid = Grid(blockSize: CGFloat(35.0), rows: 54, cols: 41)
        racecar = Racecar(x_pos: 38, y_pos: 30)
        self.key = "EinsteinCourseTwo"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  8, col: 10))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  20, col: 2))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  28, col: 38))!)
        obstacles = []
        
        //1
        
        colors = [
            UIColor(red: 233/255, green: 217/255, blue: 133/255, alpha: 1.0),
            UIColor(red: 116/255, green: 156/255, blue: 117/255, alpha: 1.0),
            UIColor(red: 93/255, green: 74/255, blue: 102/255, alpha: 1.0)
        ]
        for j in 19...21{
            
            for i in 28...40 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //2
        for j in 17...18{
            
            for i in 28...32 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //3
        for j in 7...12{
            
            for i in 23...37 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //4
        for j in 7...24{
            
            for i in 21...22 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //5
        for j in 25...27{
            
            for i in 21...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //6
        for j in 28...32{
            
            for i in 21...25 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //7
        for j in 28...43{
            
            for i in 34...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //8
        for j in 44...45{
            
            for i in 21...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //9
        for j in 47...50{
            
            for i in 5...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //10
        for j in 40...50{
            
            for i in 20...20 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //11
        for j in 39...39{
            
            for i in 8...28 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //12
        for j in 21...39{
            
            for i in 6...7 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //13
        for j in 5...20{
            
            for i in 5...7 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //14
        for j in 5...13{
            
            for i in 8...10 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //15
        for j in 2...36{
            
            for i in 13...14 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //16
        for j in 18...36{
            
            for i in 10...12 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //17
        for j in 36...36{
            
            for i in 15...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //18
        for j in 30...41{
            
            for i in 30...31 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //19
        for j in 41...41{
            
            for i in 25...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //20
        for j in 0...1{
            
            for i in 0...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //21
        for j in 2...20{
            
            for i in 0...0 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //22
        for j in 21...41{
            
            for i in 0...1 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //23
        for j in 42...44{
            
            for i in 0...17 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //24
        for j in 45...53{
            
            for i in 0...1 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //25
        for j in 54...54{
            
            for i in 0...24 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //26
        for j in 49...54{
            
            for i in 25...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        //27
        for j in 2...54{
            
            for i in 41...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
