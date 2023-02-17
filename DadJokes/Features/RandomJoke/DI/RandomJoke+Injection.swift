//
//  RandomJoke+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Resolver

// MARK: - RandomJoke
extension Resolver {
    static func registerRandomJoke() {
        registerDataLayer()
        registerDomainLayer()
        registerPresentationLayer()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let randomJoke = Self(RandomJokeResources.featureName)
}

private extension Resolver {
    // MARK: - Data
    static func registerDataLayer() {
        register { RandomJokeRemoteDataSource() as RandomJokeDataSource }
    }
    
    // MARK: - Domain
    static func registerDomainLayer() {
        register { GetRandomJokeUseCaseImpl(randomJokeDataSource: resolve()) as GetRandomJokeUseCase }
    }
    
    // MARK: - Presentation
    static func registerPresentationLayer() {
        register { RandomJokeViewModel(getRandomJokeUseCase: resolve()) }
            .scope(.shared)
        
        register { RandomJokeViewProviderImpl() as RandomJokeViewProvider }
            .implements(ViewProvider.self, name: .randomJoke)
    }
}

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
