//
//  RandomJoke+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - Data
extension Container {
    
    static let randomJokeDataSource = Factory<RandomJokeDataSource>(scope: .shared) {
        RandomJokeRemoteDataSource()
    }
}

// MARK: - Domain
extension Container {

    static let getRandomJokeUseCase = Factory<GetRandomJokeUseCase>(scope: .shared) {
        GetRandomJokeUseCaseImpl(randomJokeDataSource: randomJokeDataSource())
    }
}

// MARK: - Presentation
extension Container {

    static let randomJokeViewModel = Factory(scope: .shared) {
        RandomJokeViewModel(getRandomJokeUseCase: getRandomJokeUseCase())
    }

    static let randomJokeViewProvider = Factory<RandomJokeViewProvider> {
        RandomJokeViewProviderImpl()
    }
}
