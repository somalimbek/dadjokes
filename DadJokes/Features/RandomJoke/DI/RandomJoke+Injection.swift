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
        registerPresentation()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let randomJoke = Self(RandomJokeResources.featureName)
}

private extension Resolver {
    // MARK: - Data
    static func registerData() {
        register { RandomJokeMockDataSource() as RandomJokeDataSource }
    }
    
    // MARK: - Domain
    static func registerDomain() {
        register { GetRandomJokeUseCaseImpl() as GetRandomJokeUseCase }
    }
    
    // MARK: - Presentation
    static func registerPresentation() {
        register { RandomJokeView() }
        
        register { RandomJokeViewProviderImpl() as RandomJokeViewProvider }
            .implements(ViewProvider.self, name: .randomJoke)
    }
}
