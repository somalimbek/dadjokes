//
//  GetRandomJokeUseCaseTests.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 06. 30..
//

import Combine
import XCTest
@testable import DadJokes

class GetRandomJokeUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: GetRandomJokeUseCaseImpl!
    private var randomJokeDataSourceMock: RandomJokeDataSourceTestMock!
    private var cancellables: Set<AnyCancellable>!

    // MARK: - Set up
    override func setUp() {
        randomJokeDataSourceMock = RandomJokeDataSourceTestMock()
        sut = GetRandomJokeUseCaseImpl(randomJokeDataSource: randomJokeDataSourceMock)
        cancellables = []
    }
    
    // MARK: - Test execute success
    func testExecute_Success() {
        randomJokeDataSourceMock.success = true
        
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
        
        XCTAssertEqual(receivedJoke?.punchline, randomJokeDataSourceMock.joke.punchline)
    }
    
    // MARK: - Test execute error
    func testExecute_Error() {
        randomJokeDataSourceMock.success = false
        
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
        
        XCTAssertEqual(receivedError?.localizedDescription, randomJokeDataSourceMock.error.localizedDescription)
    }
}
