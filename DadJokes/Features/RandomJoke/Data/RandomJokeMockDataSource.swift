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
    private let joke = RandomJokeDataModel(setup: "this is the setup of the joke", punchline: "this is the punchline")
    private let error = URLError(.unknown)
    
    // MARK: - Properties
    let success = true
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
