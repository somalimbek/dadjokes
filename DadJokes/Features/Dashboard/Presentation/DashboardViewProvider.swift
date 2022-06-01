//
//  DashboardViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation
import SwiftUI

protocol DashboardViewProvider: ViewProvider {
    var randomJoke: AnyView { get }
    var favorites: AnyView { get }
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
    var rootView: AnyView { DashboardView(viewModel: DashboardViewModel(viewProvider: self)).anyView }
    var randomJoke: AnyView { randomJokeViewProvider.rootView }
    var favorites: AnyView { favoritesViewProvider.rootView }
}
