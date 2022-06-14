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

// MARK: - Presentation
private extension Resolver {
    static func registerPresentation() {
        register { DashboardView(viewModel: resolve()) }
        
        register { DashboardViewModel(viewProvider: resolve()) }
        
        register { DashboardViewProviderImpl(randomJokeViewProvider: resolve(), favoritesViewProvider: resolve()) }
            .implements(DashboardViewProvider.self)
    }
}
