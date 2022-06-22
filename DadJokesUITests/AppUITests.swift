//
//  AppUITests.swift
//  DadJokesUITests
//
//  Created by Soma Limbek on 2022. 06. 22..
//

import XCTest

class AppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testAppRootView() {
        XCTAssert(app.staticTexts[DashboardResources.featureName].exists)
    }
}
