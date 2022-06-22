//
//  DashboardViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Resolver

protocol DashboardViewProvider: ViewProvider {
    var randomJoke: Destination { get }
    var favorites: Destination { get }
}

struct DashboardViewProviderImpl {
    // MARK: - Injected Properties
    private let randomJokeViewProvider: ViewProvider = Resolver.resolve(name: .randomJoke)
    private let favoritesViewProvider: ViewProvider = Resolver.resolve(name: .favorites)
}

// MARK: - DashboardViewProvider
extension DashboardViewProviderImpl: DashboardViewProvider {
    var rootView: Destination { Resolver.resolve(DashboardView.self).asDestination }
    var randomJoke: Destination { randomJokeViewProvider.rootView }
    var favorites: Destination { favoritesViewProvider.rootView }
}
