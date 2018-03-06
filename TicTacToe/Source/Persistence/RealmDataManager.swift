//
//  RealmDataManager.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 6.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDataManager: DataManager {
    
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
    
    func save() {
//        storage?.add(<#T##object: Object##Object#>)
    }
    
}
