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

final class RealmDataManager: DataManager {
    
    private var storage: Realm?
    
    static var shared: RealmDataManager = {
        do {
            let manager = RealmDataManager()
            manager.storage = try Realm()
            return manager
        } catch {
            fatalError("Error instantiating Realm")
        }
    }()
    
    var numberOfObjects: Int {
        return allObjects().count
    }
    
    func object(atIndex index: Int) -> Game? {
        return allObjects()[index]
    }
    
    func allObjects() -> [Game] {
        return storage?.objects(Game.self).toArray() ?? []
    }
    
    func save(_ game: Game) {
        do {
            try storage?.write {
                storage?.add(game)
            }
        } catch {
            print("Error while saving a game \(error)")
        }
    }
    
}
