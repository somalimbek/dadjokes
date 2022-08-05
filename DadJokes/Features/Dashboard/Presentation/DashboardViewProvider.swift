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
    private let randomJokeViewProvider: ViewProvider
    private let favoritesViewProvider: ViewProvider
    
    // MARK: - Init
    init(randomJokeViewProvider: ViewProvider ,favoritesViewProvider: ViewProvider) {
        self.randomJokeViewProvider = randomJokeViewProvider
        self.favoritesViewProvider = favoritesViewProvider
    }
}

// MARK: - DashboardViewProvider
extension DashboardViewProviderImpl: DashboardViewProvider {
    var rootView: Destination { DashboardView().asDestination }
    var randomJoke: Destination { randomJokeViewProvider.rootView }
    var favorites: Destination { favoritesViewProvider.rootView }
}
