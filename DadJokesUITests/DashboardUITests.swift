//
//  DashboardUITests.swift
//  DadJokesUITests
//
//  Created by Soma Limbek on 2022. 06. 22..
//

import XCTest

class DashboardUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testOpenRandomJoke() {
        app.buttons[RandomJokeResources.featureName].tap()
        XCTAssert(app.staticTexts[RandomJokeResources.description].exists)
    }
    
    func testOpenFavorites() {
        app.buttons[FavoritesResources.featureName].tap()
        XCTAssert(app.staticTexts[FavoritesResources.description].exists)
    }
}
