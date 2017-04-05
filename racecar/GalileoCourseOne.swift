//
//  EasyRaceScene.swift
//  racecar
//
//  Created by Walters Mitch on 3/31/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


//var rows = 42
//var cols = 32
//var block_size = CGFloat(35.0)


class GalileoCourseOne: Course {
    
    
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        grid = Grid(blockSize: CGFloat(35.0), rows: 40, cols: 25)
        racecar = Racecar(x_pos: 22, y_pos: 22)
        
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 2))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  34, col: 22))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 22))!)
        
        obstacles = []
        for j in 5...20{
            
            for i in 5...35 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
