//
//  RandomJokeDataSourceTestMock.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 07. 12..
//

import Combine
import Foundation
@testable import DadJokes

final class RandomJokeDataSourceTestMock: RandomJokeDataSource {

    let joke = RandomJokeDataModel(setup: "mock setup", punchline: "mock punchline")
    let error = URLError(.badURL)
    
    var success = true
    
    func getRandomJoke() -> AnyPublisher<RandomJokeDataModel, Error> {
        return Future { promise in
            if self.success {
                promise(.success(self.joke))
            } else {
                promise(.failure(self.error))
            }
        }
        .eraseToAnyPublisher()
    }
}
