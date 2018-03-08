//
//  GameInteractorTests.swift
//  TicTacToeTests
//
//  Created by Robert Dimitrov on 7.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameInteractorTests: XCTestCase {
    
    var gameInteractor: GameInteractor!
    
    override func setUp() {
        super.setUp()
        
        let dataManager = TestDataManager()
        gameInteractor = GameInteractor(withDataManager: dataManager)
    }
    
    func testPlayerWin() {
        for index in [0, 1, 4, 5, 8] {
            gameInteractor.addTurn(boardIndex: index)
        }
        
        let player = gameInteractor.game.turns.last!.player == "X" ? Player.x : Player.o
        
        XCTAssert(try! gameInteractor.status.value() == GameStatus.won(player), "Player \(player) won")
    }
    
    func testInProgress() {
        XCTAssert(try! gameInteractor.status.value() == GameStatus.inProgress, "Status in progress")
    }
    
    func testDraw() {
        for index in [0, 4, 1, 2, 6, 3, 5, 7, 8] {
            gameInteractor.addTurn(boardIndex: index)
        }
        
        XCTAssert(try! gameInteractor.status.value() == GameStatus.draw, "The game finished with a draw")
    }
    
}
