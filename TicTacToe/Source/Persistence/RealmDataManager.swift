//
//  RealmDataManager.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 6.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

import RealmSwift
import RxRealm

class RealmDataManager: DataManager {
    
    private var storage: Realm
    
    init() {
        do {
            storage = try Realm()
        } catch {
            fatalError("Error instantiating Realm")
        }
    }
    
    func allObjects() -> [Game] {
        return storage.objects(Game.self).toArray()
    }
    
    func save(_ game: Game) {
        do {
            try storage.write {
                storage.add(game)
            }
        } catch {
            print("Error while saving a game \(error)")
        }
    }
    
    func update(_ game: Game, updateBlock: (Game) -> Void) {
        try! storage.write {
            updateBlock(game)
        }
    }
    
}
