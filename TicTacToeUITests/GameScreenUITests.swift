//
//  GameScreenUITests.swift
//  TicTacToeUITests
//
//  Created by Robert Dimitrov on 8.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import XCTest

class GameScreenUITests: BaseUITests {
    
    func testPlayerSwitching() {
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        
        XCTAssert(collectionViewsQuery.staticTexts["X"].exists, "There is one cell by player X")
        XCTAssert(collectionViewsQuery.staticTexts["O"].exists, "There is one cell by player O")
    }
    
    func testPlayerWin() {
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 8).children(matching: .other).element.tap()
        
        XCTAssert(app.staticTexts["Player X won."].exists, "Player X won the game")
    }
    
    func testDraw() {
        
    }
    
    func testReset() {
        
    }
    
    func testHistoryOpening() {
        app.buttons["History"].tap()
        
        XCTAssert(app.navigationBars["History"].otherElements["History"].exists, "History screen is opened")
    }
    
}
