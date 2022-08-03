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
        register { AppViewProviderImpl(dashboardViewProvider: resolve(name: .dashboard)) as AppViewProvider }
    }
}
