//
//  RaceCar.swift
//  racecar
//
//  Created by Walters Mitch on 3/21/17.
//  Copyright © 2017 Mitchell Walters. All rights reserved.
//

import Foundation


class Racecar {
    
    
    var x_position = 0
    var y_position = 0
    
    var x_velocity = 0
    var y_velocity = 0
    
    var x_acceleration = 0
    var y_acceleration = 0
    

    
    init(x_pos: Int, y_pos: Int) {
        // perform some initialization here
        x_position = x_pos
        y_position = y_pos
        
    }

    
    
    func apply_acceleration()
    {
        x_velocity += x_acceleration
        y_velocity += y_acceleration
        x_acceleration = 0
        y_acceleration = 0
    }
    
}
