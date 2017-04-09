//
//  GalileoCourseTwo.swift
//  racecar
//
//  Created by Walters Mitch on 4/6/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation



import SpriteKit
import GameplayKit
import CoreGraphics


//var rows = 42
//var cols = 32
//var block_size = CGFloat(35.0)


class GalileoCourseTwo: Course {
    
    
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        grid = Grid(blockSize: CGFloat(35.0), rows: 25, cols: 40)
        racecar = Racecar(x_pos: 37, y_pos: 14)
        
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 2))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  18, col: 2))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  13, col: 37))!)
        
        obstacles = []
        for j in 5...20{
            
            for i in 5...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
