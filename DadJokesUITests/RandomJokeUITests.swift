//
//  RandomJokeUITests.swift
//  DadJokesUITests
//
//  Created by Soma Limbek on 2022. 07. 26..
//

import Resolver
import XCTest
@testable import DadJokes

class RandomJokeUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    // TODO: Find a way to have the same mocks in UI and unit test modules
    var randomJokeMockDataSource: RandomJokeDataSourceTestMock!
    
    // MARK: - Set up
    override class func setUp() {
        Resolver.testMock.register { RandomJokeDataSourceTestMock() }
            .implements(RandomJokeDataSource.self)
            .scope(.shared)
    }
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        randomJokeMockDataSource = Resolver.optional()
        navigateToRandomJoke()
    }
    
    // MARK: - Static texts
    func test_Screen_title() {
        XCTAssert(app.navigationBars[RandomJokeResources.featureName].exists)
    }
    
    func test_Back_button_title() {
        XCTAssert(app.buttons[DashboardResources.featureName].exists)
    }
    
    // MARK: - New joke
    func test_Automatically_load_a_new_joke_when_the_screen_appears() {
        XCTAssert(app.activityIndicators.element.exists)
    }
    
    func test_Display_received_joke() {
        randomJokeMockDataSource.success = true
        
        XCTAssert(app.staticTexts["randomJokeMockDataSource.joke.setup"].waitForExistence(timeout: UITestConstants.mockResponseWaitTime))
    }
    
    // MARK: - Error
    func test_Display_received_error() {
        
    }
    
    // MARK: - Loading
    func test_Display_loader_while_getting_new_joke() {
        
    }
    
    func test_Disable_buttons_while_loading() {
        
    }
    
    func test_Enable_next_joke_button_when_loading_finished_with_success() {
        
    }
    
    func test_Enable_next_joke_button_when_loading_finished_with_error() {
        
    }
    
    // MARK: - Punchline button
    func test_Enable_show_punchline_button_if_only_the_setup_is_displayed() {
        
    }
    
    func test_Show_punchline() {
        
    }
    
    func test_Disable_show_punchline_button_if_no_joke_is_displayed() {
        
    }
    
    func test_Disable_show_punchline_button_if_punchline_is_displayed() {
        
    }
}

// MARK: - Private
private extension RandomJokeUITests {
    
    func navigateToRandomJoke() {
        app.buttons[RandomJokeResources.featureName].tap()
    }
}
