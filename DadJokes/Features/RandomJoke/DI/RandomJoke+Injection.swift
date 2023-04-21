//
//  RandomJoke+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - Data
extension Container {
    
    var randomJokeDataSource: Factory<RandomJokeDataSource> {
        self {
            RandomJokeRemoteDataSource()
        }
        .shared
    }
}

// MARK: - Domain
extension Container {

    var getRandomJokeUseCase: Factory<GetRandomJokeUseCase>{
        self {
            GetRandomJokeUseCaseImpl(randomJokeDataSource: self.randomJokeDataSource())
        }
        .shared
    }
}

// MARK: - Presentation
extension Container {

    var randomJokeViewModel: Factory<RandomJokeViewModel> {
        self {
            RandomJokeViewModel(getRandomJokeUseCase: self.getRandomJokeUseCase())
        }
        .shared
    }

    var randomJokeViewProvider: Factory<RandomJokeViewProvider> {
        self {
            RandomJokeViewProviderImpl()
        }
    }
}
