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
        
        for index in [0, 1, 4, 2, 8] {
            collectionViewsQuery.children(matching: .cell).element(boundBy: index).children(matching: .other).element.tap()
        }
        
        XCTAssert(app.staticTexts["Player X won."].exists, "Player X won the game")
    }
    
    func testDraw() {
        let collectionViewsQuery = app.collectionViews
        
        for index in [0, 1, 2, 4, 7, 3, 5, 8, 6] {
            collectionViewsQuery.children(matching: .cell).element(boundBy: index).children(matching: .other).element.tap()
        }
        
        XCTAssert(app.staticTexts["A draw."].exists, "Game finished with a draw")
    }
    
    func testReset() {
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        
        app.buttons["New game"].tap()
        
        XCTAssert(!collectionViewsQuery.staticTexts["X"].exists, "There are no X elements")
        XCTAssert(!collectionViewsQuery.staticTexts["O"].exists, "There are no O elements")
    }
    
    func testHistoryOpening() {
        app.buttons["History"].tap()
        
        XCTAssert(app.navigationBars["History"].otherElements["History"].exists, "History screen is opened")
    }
    
}
