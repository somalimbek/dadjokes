//
//  RandomJokeViewModelTests.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 07. 13..
//

import Combine
import Resolver
import XCTest
@testable import DadJokes

class RandomJokeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: RandomJokeViewModel!
    private var getRandomJokeUseCaseMock: GetRandomJokeUseCaseTestMock!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        getRandomJokeUseCaseMock = GetRandomJokeUseCaseTestMock()
        sut = RandomJokeViewModel(getRandomJokeUseCase: getRandomJokeUseCaseMock)
        cancellables = []
    }
    
    // MARK: - Tests
    func test_Get_new_joke_when_the_screen_appears() {
        let sut = RandomJokeViewModel_VerifyGetNewJoke(getRandomJokeUseCase: getRandomJokeUseCaseMock)
        
        sut.onAppear()
        XCTAssert(sut.didCallGetNewJoke)
    }
    
    func test_Display_loader_when_starting_to_get_new_joke() {
        sut = RandomJokeViewModel(getRandomJokeUseCase: GetRandomJokeUseCaseTestMock_Empty())
        
        sut.isLoading = false
        
        sut.getNewJoke()
        XCTAssertTrue(sut.isLoading)
    }
    
    func test_Hide_previous_joke_when_starting_to_get_new_joke() {
        sut = RandomJokeViewModel(getRandomJokeUseCase: GetRandomJokeUseCaseTestMock_Empty())
        
        sut.jokeSetup = ""
        sut.jokePunchline = ""
        
        sut.getNewJoke()
        XCTAssertNil(sut.jokeSetup)
        XCTAssertNil(sut.jokePunchline)
    }
    
    func test_Display_received_joke_setup() {
        getRandomJokeUseCaseMock.success = true
        
        sut.getNewJoke()
        XCTAssertEqual(sut.jokeSetup, getRandomJokeUseCaseMock.joke.setup)
        XCTAssertNil(sut.jokePunchline)
        
        XCTAssertNil(sut.error)
    }
    
    func test_Hide_loader_after_receiving_new_joke() {
        getRandomJokeUseCaseMock.success = true
        sut.isLoading = true
        
        sut.getNewJoke()
        XCTAssertFalse(sut.isLoading)
    }
    
    func test_Display_error_received_when_asked_for_new_joke() {
        getRandomJokeUseCaseMock.success = false
        
        sut.getNewJoke()
        XCTAssertEqual(sut.error?.localizedDescription, getRandomJokeUseCaseMock.error.localizedDescription)
        XCTAssertTrue(sut.showAlert)
    }
    
    func test_Hide_loader_after_error_received_when_asked_for_new_joke() {
        getRandomJokeUseCaseMock.success = false
        sut.isLoading = true
        
        sut.getNewJoke()
        XCTAssertFalse(sut.isLoading)
    }
    
    func test_Display_punchline() {
        getRandomJokeUseCaseMock.success = true
        sut.getNewJoke()
        
        sut.showPunchline()
        XCTAssertEqual(sut.jokePunchline, getRandomJokeUseCaseMock.joke.punchline)
    }
}

// MARK: - Private
private extension RandomJokeViewModelTests {
    class RandomJokeViewModel_VerifyGetNewJoke: RandomJokeViewModel {
        
        var didCallGetNewJoke = false
        
        override func getNewJoke() {
            didCallGetNewJoke = true
        }
    }
}
