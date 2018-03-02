//
//  Player.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

enum Player: String {
    
    case x = "X"
    case o = "O"
    
    var name: String {
        return rawValue
    }
    
}
