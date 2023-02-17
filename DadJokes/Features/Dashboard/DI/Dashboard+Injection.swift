//
//  Dashboard+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - Presentation
extension Container {
    
    static let dashboardViewModel = Factory(scope: .shared) {
        DashboardViewModel(viewProvider: dashboardViewProvider())
    }

    static let dashboardViewProvider = Factory<DashboardViewProvider> {
        DashboardViewProviderImpl(
            randomJokeViewProvider: randomJokeViewProvider(),
            favoritesViewProvider: favoritesViewProvider()
        )
    }
}
