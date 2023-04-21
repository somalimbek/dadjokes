//
//  Dashboard+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - Presentation
extension Container {
    
    var dashboardViewModel: Factory<DashboardViewModel> {
        self {
            DashboardViewModel(viewProvider: self.dashboardViewProvider())
        }
        .shared
    }

    var dashboardViewProvider: Factory<DashboardViewProvider> {
        self {
            DashboardViewProviderImpl(
                randomJokeViewProvider: self.randomJokeViewProvider(),
                favoritesViewProvider: self.favoritesViewProvider()
            )
        }
    }
}
