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
        registerCoordinatorLayer()
        registerPresentationLayer()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let dashboard = Self(DashboardResources.featureName)
}

// MARK: - Presentation
private extension Resolver {
    static func registerCoordinatorLayer() {
        register { DashboardCoordinatorImpl(rootView: resolve(), viewModel: resolve()) as DashboardCoordinator }
        
        register { DashboardCoordinatorView(viewModel: resolve()) }
        
        register { DashboardCoordinatorViewModel() }
            .scope(.shared)
    }
    
    static func registerPresentationLayer() {
        register { DashboardViewModel(coordinator: resolve()) }
            .scope(.shared)
    }
}
