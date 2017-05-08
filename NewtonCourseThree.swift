//
//  NewtonCourseTwo.swift
//  racecar
//
//  Created by Walters Mitch on 4/7/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


class NewtonCourseThree: Course {

    
    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "07WaterskiMe")
        grid = Grid(blockSize: CGFloat(35.0), rows: 53, cols: 42)
        grid?.position = CGPoint(x: -300, y: 0)
        racecar = Racecar(x_pos: 33, y_pos: 22)
        self.key = "NewtonCourseThree"
        cup_membership = "Newton"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  8, col: 10))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  36, col: 4))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  21, col: 32))!)
        obstacles = []
        
//        colors = [
//            UIColor(red: 164/255, green: 14/255, blue: 76/255, alpha: 1.0),
//            UIColor(red: 44/255, green: 44/255, blue: 84/255, alpha: 1.0),
//            UIColor(red: 172/255, green: 195/255, blue: 166/255, alpha: 1.0)
//        ]
        
        //1
        for j in 6...23{
            
            for i in 22...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //2
        for j in 24...45{
            
            for i in 23...29 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //3
        for j in 24...36{
            
            for i in 7...12 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //4
        for j in 6...23{
            
            for i in 7...10 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //5
        for j in 24...25{
            
            for i in 13...22 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //6
        for j in 20...23{
            
            for i in 15...16 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        //7
        for j in 14...19{
            
            for i in 15...15 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 2...18{
            
            for i in 13...13 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //9
        for j in 2...18{
            
            for i in 18...18 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //10
        for j in 13...13{
            
            for i in 15...16{
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //11
        for j in 10...10{
            
            for i in 15...16 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //12
        for j in 30...45{
            
            for i in 30...32 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //13
        for j in 31...40{
            
            for i in 14...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //14
        for j in 41...52{
            
            for i in 0...19 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //15
        for j in 2...40 {
            
            for i in 0...1 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //16
        for j in 0...1{
            
            for i in 0...35 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //17
        for j in 0...25{
            
            for i in 36...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //18
        for j in 26...50{
            
            for i in 39...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //19
        for j in 51...52{
            
            for i in 20...41 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        
        create_scene_specs()
        super.didMove(to: view)
        
    }

    

}
