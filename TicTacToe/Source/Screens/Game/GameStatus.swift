//
//  GameStatus.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 8.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

enum GameStatus {
    case inProgress
    case draw
    case won(Player)
}

extension GameStatus: Equatable {
    static func ==(lhs: GameStatus, rhs: GameStatus) -> Bool {
        switch (lhs, rhs) {
        case (.won(let a), .won(let b)) where a == b:
            return true
        case (.draw, .draw):
            return true
        case (.inProgress, .inProgress):
            return true
        default:
            return false
        }
    }
}
