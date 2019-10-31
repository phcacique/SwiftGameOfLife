//
//  Theme.swift
//  GameOfLife
//
//  Created by Pedro Cacique on 29/10/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import SpriteKit

struct Theme {
    struct Colors {
        static let bgColor:SKColor = SKColor(red: 41/255, green: 42/255, blue: 47/255, alpha: 1.0)
        static let gridColor:SKColor = SKColor(red: 114/255, green: 115/255, blue: 118/255, alpha: 1.0)
        static let cellColor:SKColor = SKColor(red: 255/255, green: 107/255, blue: 107/255, alpha: 1.0)
        
        static let playButtonColor:SKColor = SKColor(red: 29/255, green: 209/255, blue: 161/255, alpha: 1.0)
        static let pauseButtonColor:SKColor = SKColor(red: 255/255, green: 107/255, blue: 107/255, alpha: 1.0)
        static let clearButtonColor:SKColor = SKColor(red: 131/255, green: 149/255, blue: 167/255, alpha: 1.0)
        static let nextGenButtonColor:SKColor = SKColor(red: 254/255, green: 202/255, blue: 87/255, alpha: 1.0)
    }
}
