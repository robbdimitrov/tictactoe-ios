//
//  BaseUITests.swift
//  TicTacToeUITests
//
//  Created by Robert Dimitrov on 8.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import XCTest

class BaseUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments += ["UI-TESTING"]
        continueAfterFailure = false
        app.launch()
    }
    
}
