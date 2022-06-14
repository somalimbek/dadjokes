//
//  DashboardViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Resolver
import SwiftUI

protocol DashboardViewProvider: ViewProvider {
    var randomJoke: Destination { get }
    var favorites: Destination { get }
}

struct DashboardViewProviderImpl {
    private let randomJokeViewProvider: RandomJokeViewProvider
    private let favoritesViewProvider: FavoritesViewProvider
    
    init(randomJokeViewProvider: RandomJokeViewProvider, favoritesViewProvider: FavoritesViewProvider) {
        self.randomJokeViewProvider = randomJokeViewProvider
        self.favoritesViewProvider = favoritesViewProvider
    }
}

extension DashboardViewProviderImpl: DashboardViewProvider {
    var rootView: Destination { Resolver.resolve(DashboardView.self).asDestination }
    var randomJoke: Destination { randomJokeViewProvider.rootView }
    var favorites: Destination { favoritesViewProvider.rootView }
}
