//
//  GetRandomJokeUseCaseTestMock.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 07. 13..
//

import Combine
import Foundation
@testable import DadJokes

final class GetRandomJokeUseCaseTestMock: NetworkingTestMock {
    
    let joke = RandomJokeDomainModel(setup: "mock setup", punchline: "mock punchline")
    let error = URLError(.badURL)
    
    // MARK: - NetworkingTestMock
    var success = true
}

// MARK: - GetRandomJokeUseCase
extension GetRandomJokeUseCaseTestMock: GetRandomJokeUseCase {
    
    func execute() -> AnyPublisher<RandomJokeDomainModel, Error> {
        return futureAsAnyPublisher(output: joke, error: error)
    }
}

// MARK: - Empty mock
final class GetRandomJokeUseCaseTestMock_Empty: GetRandomJokeUseCase {
    
    func execute() -> AnyPublisher<RandomJokeDomainModel, Error> {
        return Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }
}
