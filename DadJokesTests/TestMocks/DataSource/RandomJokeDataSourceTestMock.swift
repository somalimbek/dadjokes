//
//  RandomJokeDataSourceTestMock.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 07. 12..
//

import Combine
import Foundation
@testable import DadJokes

final class RandomJokeDataSourceTestMock: NetworkingTestMock {

    let joke = RandomJokeDataModel(setup: "mock setup", punchline: "mock punchline")
    let error = URLError(.badURL)
    
    // MARK: - NetworkingTestMock
    var success = true
}

// MARK: - RandomJokeDataSource
extension RandomJokeDataSourceTestMock: RandomJokeDataSource {
    
    func getRandomJoke() -> AnyPublisher<RandomJokeDataModel, Error> {
        return futureAsAnyPublisher(output: joke, error: error)
    }
}
