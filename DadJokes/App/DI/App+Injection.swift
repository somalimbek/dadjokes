//
//  App+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Resolver

// MARK: - ResolverRegistering
extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerApp()
        registerDashboard()
        registerFavorites()
        registerRandomJoke()
    }
}

// MARK: - App
private extension Resolver {    
    static func registerApp() {
        registerPresentation()
    }
    
    // MARK: - Presentation
    static func registerPresentation() {
        register { AppView(viewModel: resolve()) }
        
        register { AppViewModel(viewProvider: resolve()) }
        
        register { AppViewProviderImpl(dashboardViewProvider: resolve()) }
            .implements(AppViewProvider.self)
    }
}
