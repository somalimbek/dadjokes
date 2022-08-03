//
//  Dashboard+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Resolver

// MARK: - Dashboard
extension Resolver {
    static func registerDashboard() {
        registerPresentation()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let dashboard = Self(DashboardResources.featureName)
}

// MARK: - Presentation
private extension Resolver {
    static func registerPresentation() {
        register { DashboardViewModel(viewProvider: resolve()) }
            .scope(.shared)
        
        register {
            DashboardViewProviderImpl(randomJokeViewProvider: resolve(name: .randomJoke),
                                      favoritesViewProvider: resolve(name: .favorites)) as DashboardViewProvider
        }
        .implements(ViewProvider.self, name: .dashboard)
    }
}
