//
//  Turn.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 2.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RealmSwift

class Turn: Object {
    
    @objc dynamic var player: String = Player.x.name
    @objc dynamic var position: Int = 0
    
}
