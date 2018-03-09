//
//  HistoryScreenUITests.swift
//  TicTacToeUITests
//
//  Created by Robert Dimitrov on 8.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import XCTest

class HistoryScreenUITests: BaseUITests {
    
    func testEmptyHistory() {
        app.buttons["History"].tap()
        XCTAssert(app.staticTexts["No games found."].exists, "The history list is empty")
    }
    
    func testHistoryExisting() {
        for index in [0, 1, 4, 5, 8] {
            app.collectionViews.children(matching: .cell).element(boundBy: index).children(matching: .other).element.tap()
        }
        
        app.buttons["History"].tap()
        
        XCTAssert(app.collectionViews.cells.count > 0, "There are items in history screen")
    }
    
}
