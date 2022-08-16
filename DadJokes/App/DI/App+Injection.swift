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
        registerCommon()
        registerDashboard()
        registerFavorites()
        registerRandomJoke()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let app = Self(CommonResources.app)
}

// MARK: - App
private extension Resolver {    
    static func registerApp() {
        register { AppCoordinatorImpl(rootView: resolve(), viewModel: resolve()) as AppCoordinator }
        
        register { AppCoordinatorView(viewModel: resolve()) }
        
        register { AppCoordinatorViewModel() }
            .scope(.shared)
    }
}
