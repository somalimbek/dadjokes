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

// MARK: - Presentation
private extension Resolver {
    static func registerPresentation() {
        register { RandomJokeView() }
        
        register { RandomJokeViewProviderImpl() as RandomJokeViewProvider }
            .implements(ViewProvider.self, name: .randomJoke)
    }
}
