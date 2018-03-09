//
//  HistoryInteractorTests.swift
//  TicTacToeTests
//
//  Created by Robert Dimitrov on 7.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import XCTest
@testable import TicTacToe

class HistoryInteractorTests: XCTestCase {
    
    func testAddition() {
        let dataManager = InMemoryDataManager()
        
        for _ in 0..<3 {
            dataManager.save(Game(value: ["grid": [String](repeating: "", count: 9)]))
        }
        
        let historyInteractor = HistoryInteractor(withDataManager: dataManager)
        historyInteractor.fetchData()
        
        XCTAssertEqual(try! historyInteractor.games.value().count, 3, "There should be three game instances in memory.")
    }
    
}
