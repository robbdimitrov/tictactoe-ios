//
//  Game.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RealmSwift

class Game: Object {
    
    var grid = List<String>()
    var turns = List<Turn>()
    @objc dynamic var date = Date()
    @objc dynamic var isFinished = false
    @objc dynamic var winner: String?
    
}
