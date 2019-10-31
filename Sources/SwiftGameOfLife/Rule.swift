//
//  Rule.swift
//  GameOfLife
//
//  Created by Pedro Cacique on 29/10/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation

//MARK: - RULE PROTOCOL
protocol Rule {
    var name: String { get set }
    var startState: CellState { get set }
    var endState: CellState { get set }
    
    func apply(state:CellState, neighbors:[Cell]) -> CellState
}

//MARK: - COUNT RULE
class CountRule: Rule {
    var name: String
    var startState: CellState
    var endState: CellState
    var count: Int
    var type: CountRuleType
    
    init(name:String, startState:CellState, endState:CellState, count:Int, type:CountRuleType = .greaterThan) {
        self.name = name
        self.startState = startState
        self.endState = endState
        self.count = count
        self.type = type
    }
    
    func apply(state:CellState, neighbors:[Cell]) -> CellState{
        var newState:CellState = state
        if state == self.startState{
            if (self.type == .greaterThan && neighbors.count > self.count) ||
                (self.type == .lessThan && neighbors.count < self.count) ||
                (self.type == .equals && neighbors.count == self.count){
                newState = self.endState
            } else {
                newState = state
            }
        }
        return newState
    }
}

enum CountRuleType{
    case greaterThan, lessThan, equals
}
