//
//  GalileoCourseThree.swift
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


class GalileoCourseThree: Course {
    
    
    init() {
        super.init(size: CGSize(), difficulty: "hard")
    }
    
    override func create_scene_specs() {
        audioooo = SKAudioNode(fileNamed: "Bloodlines")
        grid = Grid(blockSize: CGFloat(35.0), rows: 34, cols: 28)
        racecar = Racecar(x_pos: 24, y_pos: 18)
        self.key = "GalileoCourseThree"
        self.draw_checkpoint_one(position: (grid?.gridPosition(row:  7, col: 14))!)
        self.draw_checkpoint_two(position: (grid?.gridPosition(row:  25, col: 14))!)
        self.draw_finish_line(position: (grid?.gridPosition(row:  17, col: 23))!)
        
        colors = [
            UIColor(red: 72/255, green: 172/255, blue: 240/255, alpha: 1.0),
            UIColor(red: 89/255, green: 66/255, blue: 54/255, alpha: 1.0),
            UIColor(red: 255/255, green: 165/255, blue: 82/255, alpha: 1.0)
        ]
        
        obstacles = []
        
        //1
        for j in 0...10{
            
            for i in 0...12 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //2
        for j in 0...1{
            
            for i in 13...25 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //3
        for j in 0...32{
            
            for i in 26...28 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //4
        for j in 33...34{
            
            for i in 13...28 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //5
        for j in 23...34{
            
            for i in 0...12 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //6
        for j in 11...22{
            
            for i in 0...1 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //7
        for j in 15...18{
            
            for i in 5...16 {
                
                obstacles.append(x: j, y: i)
                
            }
        }
        
        //8
        for j in 6...28 {
            
            for i in 17...21 {
                
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
