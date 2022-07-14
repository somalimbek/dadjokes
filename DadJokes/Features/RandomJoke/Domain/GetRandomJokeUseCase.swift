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
    // MARK: - Properties
    private let randomJokeDataSource: RandomJokeDataSource = Resolver.resolve()
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
