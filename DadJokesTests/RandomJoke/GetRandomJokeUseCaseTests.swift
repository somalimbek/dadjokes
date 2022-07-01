//
//  GetRandomJokeUseCaseTests.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 06. 30..
//

import Combine
import Resolver
import XCTest
@testable import DadJokes

class GetRandomJokeUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: GetRandomJokeUseCaseImpl!
    private var cancellables: Set<AnyCancellable>!

    // MARK: - Set up
    override func setUp() {
        cancellables = []
    }
    
    // MARK: - Test execute success
    func testExecute_Success() {
        register(randomJokeMockDataSource: randomJokeMockDataSource_Success)
        sut = GetRandomJokeUseCaseImpl()
        
        var receivedJoke: RandomJokeDomainModel?
        sut.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { joke in
                receivedJoke = joke
            })
            .store(in: &cancellables)
        
        XCTAssertEqual(receivedJoke?.setup, setupMock)
    }
    
    // MARK: - Test execute error
    func testExecute_Error() {
        register(randomJokeMockDataSource: randomJokeMockDataSource_Error)
        sut = GetRandomJokeUseCaseImpl()
        
        var receivedError: Error?
        sut.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    receivedError = error
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        XCTAssertEqual((receivedError as? ErrorMock)?.description, errorMock.description)
    }
}

// MARK: - Mocks
private extension GetRandomJokeUseCaseTests {
    
    var setupMock: String { "setup mock"}
    var punchlineMock: String { "punchline mock"}
    var errorMock: ErrorMock { ErrorMock() }
    
    var randomJokeDataModelMock: RandomJokeDataModel {
        RandomJokeDataModel(setup: setupMock, punchline: punchlineMock)
    }
    
    var randomJokeMockDataSource_Success: RandomJokeMockDataSource {
        RandomJokeMockDataSource(
            success: true,
            joke: randomJokeDataModelMock,
            error: errorMock
        )
    }
    
    var randomJokeMockDataSource_Error: RandomJokeMockDataSource {
        RandomJokeMockDataSource(
            success: false,
            joke: randomJokeDataModelMock,
            error: errorMock
        )
    }
    
    func register(randomJokeMockDataSource: RandomJokeMockDataSource) {
        Resolver.testMock.register { randomJokeMockDataSource as RandomJokeDataSource }
            .scope(.shared)
    }
}
