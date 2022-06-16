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
        register { AppViewProviderImpl() }
            .implements(AppViewProvider.self)
    }
}
