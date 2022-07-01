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
    private let defaultJoke = RandomJokeDataModel(setup: "this is the setup of the joke", punchline: "this is the punchline")
    private let defaultError = URLError(.unknown)
    
    // MARK: - Properties
    let success: Bool
    let joke: RandomJokeDataModel
    let error: Error
    
    // MARK: - Init
    init(success: Bool = true, joke: RandomJokeDataModel? = nil, error: Error? = nil) {
        self.success = success
        self.joke = joke ?? defaultJoke
        self.error = error ?? defaultError
    }
}

// MARK: - RandomJokeDataSource
extension RandomJokeMockDataSource: RandomJokeDataSource {
    func getRandomJoke() -> Future<RandomJokeDataModel, Error> {
        return Future { promise in
            if success {
                promise(.success(joke))
            } else {
                promise(.failure(error))
            }
        }
    }
}
