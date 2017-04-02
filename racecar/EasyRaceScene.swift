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


class EasyRaceScene: Course {
    
    
    init() {
        super.init(size: CGSize(), difficulty: "hard")
        grid = Grid(blockSize: CGFloat(35.0), rows: 40, cols: 25)
        racecar = Racecar(x_pos: 20, y_pos: 22)
        obstacles = []
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
