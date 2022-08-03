//
//  RandomJokeMockDataSource.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 29..
//

import Combine
import Foundation

struct RandomJokeMockDataSource {
    
    // MARK: - Default values
    private static var previousJokeNumber = 0
    private var randomJokeNumber: Int { Int.random(in: 1...30) }
    private var joke: RandomJokeDataModel {
        var jokeNumber = self.randomJokeNumber
        while jokeNumber == Self.previousJokeNumber {
            jokeNumber = self.randomJokeNumber
        }
        return RandomJokeDataModel(setup: "Setup \(jokeNumber)", punchline: "Punchline \(jokeNumber)")
    }
    private let error = URLError(.unknown)
    
    // MARK: - Properties
    private let success = true
}

// MARK: - RandomJokeDataSource
extension RandomJokeMockDataSource: RandomJokeDataSource {
    func getRandomJoke() -> AnyPublisher<RandomJokeDataModel, Error> {
        return Future { promise in
            if success {
                promise(.success(joke))
            } else {
                promise(.failure(error))
            }
        }
        .delay(for: .seconds(Constants.mockResponseDelay), scheduler: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
