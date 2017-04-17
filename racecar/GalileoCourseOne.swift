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
    
    
//    init() {
//        super.init(size: CGSize(), difficulty: "hard", type: "grand_prix")
////        audioooo = SKAudioNode(fileNamed: "Deththeme")
////        grid = Grid(blockSize: CGFloat(35.0), rows: 40, cols: 25)
////        racecar = Racecar(x_pos: 22, y_pos: 22)
////        key = "GalileoCourseOne"
////        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 2))!)
////        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  34, col: 22))!)
////        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 22))!)
////        
////        colors = [
////            UIColor(red: 72/255, green: 172/255, blue: 240/255, alpha: 1.0),
////            UIColor(red: 89/255, green: 66/255, blue: 54/255, alpha: 1.0),
////            UIColor(red: 255/255, green: 165/255, blue: 82/255, alpha: 1.0)
////        ]
////        
////        obstacles = []
////        for j in 5...20{
////            
////            for i in 5...35 {
////                
////                obstacles.append(x: i, y: j)
////                
////            }
////        }
//    }
    
    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "Deththeme")
        grid = Grid(blockSize: CGFloat(35.0), rows: 40, cols: 25)
        racecar = Racecar(x_pos: 22, y_pos: 22)
        key = "GalileoCourseOne"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 2))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  34, col: 22))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  19, col: 22))!)
        
        colors = [
            UIColor(red: 72/255, green: 172/255, blue: 240/255, alpha: 1.0),
            UIColor(red: 89/255, green: 66/255, blue: 54/255, alpha: 1.0),
            UIColor(red: 255/255, green: 165/255, blue: 82/255, alpha: 1.0)
        ]
        
        obstacles = []
        for j in 5...20{
            
            for i in 5...35 {
                
                obstacles.append(x: i, y: j)
                
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        create_scene_specs()
        super.didMove(to: view)
                
    }

}
