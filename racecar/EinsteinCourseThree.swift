//
//  File.swift
//  racecar
//
//  Created by Walters Mitch on 4/6/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class EinsteinCourseThree: Course {
    init() {
        super.init(size: CGSize(), difficulty: "hard")

        
        
        
    }
    
    
    override func create_scene_specs() {
        
        audioooo = SKAudioNode(fileNamed: "Symmetry")
        grid = Grid(blockSize: CGFloat(35.0), rows: 38, cols: 38)
        racecar = Racecar(x_pos: 31, y_pos: 11)
        self.key = "EinsteinCourseThree"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  6, col: 6))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  34, col: 2))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  10, col: 31))!)
        obstacles = []
        
        colors = [
            UIColor(red: 233/255, green: 217/255, blue: 133/255, alpha: 1.0),
            UIColor(red: 116/255, green: 156/255, blue: 117/255, alpha: 1.0),
            UIColor(red: 93/255, green: 74/255, blue: 102/255, alpha: 1.0)
        ]
        
        //1
        for j in 9...13{
            
            for i in 27...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //2
        for j in 14...15{
            
            for i in 19...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //3
        for j in 12...13{
            
            for i in 19...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //4
        for j in 16...21{
            
            for i in 23...23 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //5
        for j in 22...22{
            
            for i in 19...32 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //6
        for j in 23...30{
            
            for i in 28...32 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //7
        for j in 29...30{
            
            for i in 0...27 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 25...25{
            
            for i in 18...25 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //9
        for j in 20...25{
            
            for i in 15...17 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //10
        for j in 18...19{
            
            for i in 15...20 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //11
        for j in 5...17{
            
            for i in 15...16 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //12
        for j in 5...8{
            
            for i in 17...24 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //13
        for j in 9...10{
            
            for i in 23...24 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //14
        for j in 5...6{
            
            for i in 25...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //15
        for j in 3...4{
            
            for i in 9...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //16
        for j in 3...26{
            
            for i in 8...8 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //17
        for j in 6...28{
            
            for i in 11...11 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //18
        for j in 7...18{
            
            for i in 33...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //19
        for j in 18...18{
            
            for i in 26...32 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //20
        for j in 19...35{
            
            for i in 35...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //21
        for j in 34...35{
            
            for i in 4...34 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //22
        for j in 0...28{
            
            for i in 0...5 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //23
        for j in 0...0{
            
            for i in 6...38 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //24
        for j in 0...38{
            
            for i in 38...39 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //25
        for j in 38...39{
            
            for i in 0...39 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //26
        for j in 31...38{
            
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
