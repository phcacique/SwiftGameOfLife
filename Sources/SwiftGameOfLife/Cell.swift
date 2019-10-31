//
//  Cell.swift
//  GameOfLife
//
//  Created by Pedro Cacique on 29/10/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation

public class Cell{
    var x:Int
    var y:Int
    var state:CellState
    var liveNeighbors: [Cell] = []
    
    init(x:Int, y:Int, state:CellState = .dead) {
        self.x = x
        self.y = y
        self.state = state
    }
}

public enum CellState{
    case alive, dead
}
