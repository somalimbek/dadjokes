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
    func testOnAppear() {
        let sut = RandomJokeViewModel_VerifyGetNewJoke(getRandomJokeUseCase: getRandomJokeUseCaseMock)
        
        sut.onAppear()
        XCTAssert(sut.didCallGetNewJoke)
    }
    
    func testGetNewJoke_SetsIsLoading_True() {
        Resolver.testMock.register {  }
            .implements(GetRandomJokeUseCase.self)
            .scope(.shared)
        sut = RandomJokeViewModel(getRandomJokeUseCase: GetRandomJokeUseCaseTestMock_Empty())
        
        sut.isLoading = false
        
        sut.getNewJoke()
        XCTAssertTrue(sut.isLoading)
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
