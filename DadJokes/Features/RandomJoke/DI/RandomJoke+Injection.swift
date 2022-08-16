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
    }
}
