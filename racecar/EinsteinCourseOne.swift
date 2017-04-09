//
//  EinsteinCourseOne.swift
//  racecar
//
//  Created by Walters Mitch on 4/2/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class EinsteinCourseOne: Course {
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        grid = Grid(blockSize: CGFloat(35.0), rows: 53, cols: 41)
        racecar = Racecar(x_pos: 38, y_pos: 39)
        
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  24, col: 23))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  22, col: 7))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  38, col: 39))!)
        obstacles = []
        
        colors = [
            UIColor(red: 233/255, green: 217/255, blue: 133/255, alpha: 1.0),
            UIColor(red: 116/255, green: 156/255, blue: 117/255, alpha: 1.0),
            UIColor(red: 93/255, green: 74/255, blue: 102/255, alpha: 1.0)
        ]
        
        //1
        for j in 4...5{
            
            for i in 4...44 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //2
        for j in 10...13{
            
            for i in 0...39 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //3
        for j in 18...21{
            
            for i in 4...44 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //4
        for j in 26...28{
            
            for i in 0...39 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //5
        for j in 33...36{
            
            for i in 4...44 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        //6
        for j in 4...36{
            
            for i in 45...49 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
