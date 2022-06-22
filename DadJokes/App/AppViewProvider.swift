//
//  AppViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Resolver

protocol AppViewProvider: ViewProvider { }

struct AppViewProviderImpl {
    
    // MARK: - Properties
    private let dashboardViewProvider: ViewProvider = Resolver.resolve(name: .dashboard)
}

// MARK: - AppViewProvider
extension AppViewProviderImpl: AppViewProvider {
    var rootView: Destination { dashboardViewProvider.rootView }
}
