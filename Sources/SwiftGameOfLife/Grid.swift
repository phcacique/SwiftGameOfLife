//
//  Grid.swift
//  GameOfLife
//
//  Created by Pedro Cacique on 29/10/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation

public class Grid{
    public var width:Int
    public var height:Int
    public var cells: [[Cell]]
    public var rules: [Rule] = []
    
    public init(width:Int = 10, height:Int = 10, isRandom:Bool = false) {
        self.width = width
        self.height = height
        self.cells = []
        
        if isRandom{
            initRandomGrid(width, height)
        } else {
            initEmptyGrid(width, height)
        }
    }
    
    public func initEmptyGrid(_ width: Int, _ height: Int) {
        cells = []
        for i in 0..<width{
            var row:[Cell] = []
            for j in 0..<height{
                row.append(Cell(x: i, y: j , state: .dead))
            }
            cells.append(row)
        }
    }
    
    public func initRandomGrid(_ width: Int, _ height: Int) {
        cells = []
        for i in 0..<width{
            var row:[Cell] = []
            for j in 0..<height{
                let state:CellState = (Int.random(in: 0 ..< 10)>4) ? .dead : .alive
                row.append(Cell(x: i, y: j , state: .dead))
            }
            cells.append(row)
        }
    }
    
    public func getLiveNeighbors(cell:Cell) -> [Cell] {
        let i:Int = cell.x
        let j:Int = cell.y
        let state:CellState = .alive
        var neighbors:[Cell] = []
        //line above
        if j>0 {
            if i>0 && self.cells[i-1][j-1].state == state{
                    neighbors.append(self.cells[i-1][j-1])
            }
            if self.cells[i][j-1].state == state{
                neighbors.append(self.cells[i][j-1])
            }
            if i<self.width-1 && self.cells[i+1][j-1].state == state {
                neighbors.append(self.cells[i+1][j-1])
            }
        }
        
        //current line
        if i>0 && cells[i-1][j].state == state {
            neighbors.append(self.cells[i-1][j])
        }
        if i<self.width-1 && self.cells[i+1][j].state == state {
            neighbors.append(self.cells[i+1][j])
        }
        
        //line beyond
        if j<self.height-1 {
            if i>0 && self.cells[i-1][j+1].state == state {
                neighbors.append(self.cells[i-1][j+1])
            }
            if self.cells[i][j+1].state == state {
                neighbors.append(self.cells[i][j+1])
            }
            if i<self.width-1 && self.cells[i+1][j+1].state == state {
                neighbors.append(self.cells[i+1][j+1])
            }
        }
        
        return neighbors
    }
    
    public func getCellState(i:Int, j:Int) -> CellState{
        return self.cells[i][j].state
    }
    
    public func setCellState(i:Int, j:Int, state:CellState){
        self.cells[i][j].state = state
    }
    
    public func clear(){
        initEmptyGrid(self.width, self.height)
    }
    
    public func addRule(_ rule:Rule){
        self.rules.append(rule)
    }
    
    public func applyRules(){
        var newCells = cells
        for i in 0..<width{
            for j in 0..<height{
                let n:[Cell] = getLiveNeighbors(cell: cells[i][j])
                var newState:CellState = .dead
                let oldState:CellState = cells[i][j].state

                for rule in rules {
                    newState = rule.apply(state: oldState, neighbors: n)
                    if newState != oldState {
                        break
                    }
                }
                
                newCells[i][j] = Cell(x: i, y: j, state: newState)
            }
        }
        cells = newCells
    }
}
