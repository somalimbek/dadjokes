//
//  DashboardViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation

enum DashboardViewProvider: ViewProvider {
    static let rootView = DashboardView().anyView
    
    static let randomJoke = RandomJokeViewProvider.rootView
    static let favorites = FavoritesViewProvider.rootView
}
