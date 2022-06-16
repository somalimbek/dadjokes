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
    // MARK: - Injected Properties
    @Injected private var randomJokeViewProvider: RandomJokeViewProvider
    @Injected private var favoritesViewProvider: FavoritesViewProvider
}

// MARK: - DashboardViewProvider
extension DashboardViewProviderImpl: DashboardViewProvider {
    var rootView: Destination { Resolver.resolve(DashboardView.self).asDestination }
    var randomJoke: Destination { randomJokeViewProvider.rootView }
    var favorites: Destination { favoritesViewProvider.rootView }
}
