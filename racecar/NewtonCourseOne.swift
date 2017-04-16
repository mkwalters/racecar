//
//  GalileoCourseFour.swift
//  racecar
//
//  Created by Walters Mitch on 4/7/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


//var rows = 42
//var cols = 32
//var block_size = CGFloat(35.0)


class NewtonCourseOne: Course {
    
    
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        

    }
    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "Comet Song")
        grid = Grid(blockSize: CGFloat(35.0), rows: 47, cols: 37)
        racecar = Racecar(x_pos: 33, y_pos: 15)
        self.key = "NewtonCourseOne"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  23, col: 12))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  23, col: 24))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  14, col: 33))!)
        
        
        colors = [
            UIColor(red: 164/255, green: 14/255, blue: 76/255, alpha: 1.0),
            UIColor(red: 44/255, green: 44/255, blue: 84/255, alpha: 1.0),
            UIColor(red: 172/255, green: 195/255, blue: 166/255, alpha: 1.0)
        ]
        
        obstacles = []
        
        //1
        for j in 6...18{
            
            for i in 7...14 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //2
        for j in 6...18{
            
            for i in 23...30 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //3
        for j in 28...40{
            
            for i in 7...14 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //4
        for j in 28...40{
            
            for i in 23...30 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //5
        for j in 15...31{
            
            for i in 15...22 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //6
        for j in 23...24{
            
            for i in 1...11 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //7
        for j in 1...10{
            
            for i in 18...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 23...24 {
            
            for i in 26...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //9
        for j in 36...45 {
            
            for i in 18...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //10
        for j in 0...0 {
            
            for i in 0...36 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //11
        for j in 1...46 {
            
            for i in 36...36 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //12
        for j in 46...46 {
            
            for i in 0...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //13
        for j in 1...45 {
            
            for i in 0...0 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
    }
    
    override func didMove(to view: SKView) {
        create_scene_specs()
        super.didMove(to: view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
