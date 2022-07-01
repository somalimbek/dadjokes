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
            .flatMap { dataModel -> Future<RandomJokeDomainModel, Error> in
                Future { promise in
                    let domainModel = RandomJokeDomainModel(fromDataModel: dataModel)
                    promise(.success(domainModel))
                }
            }
            .eraseToAnyPublisher()
    }
}
