//
//  GetRandomJokeUseCase.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 24..
//

import Combine
import Resolver

protocol GetRandomJokeUseCase {
    func execute() -> AnyPublisher<RandomJokeDomainModel, Error>
}

struct GetRandomJokeUseCaseImpl {
    // MARK: - Injected Properties
    private let randomJokeDataSource: RandomJokeDataSource
    
    // MARK: - Init
    init(randomJokeDataSource: RandomJokeDataSource) {
        self.randomJokeDataSource = randomJokeDataSource
    }
}

// MARK: - GetRandomJokeUseCase
extension GetRandomJokeUseCaseImpl: GetRandomJokeUseCase {
    func execute() -> AnyPublisher<RandomJokeDomainModel, Error> {
        return randomJokeDataSource.getRandomJoke()
            .flatMap { joke -> Future<RandomJokeDomainModel, Error> in
                Future { promise in
                    promise(.success(joke.domainModel))
                }
            }
            .eraseToAnyPublisher()
    }
}
