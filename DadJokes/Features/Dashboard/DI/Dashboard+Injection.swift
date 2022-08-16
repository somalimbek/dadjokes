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
        registerPresentationLayer()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let dashboard = Self(DashboardResources.featureName)
}

// MARK: - Presentation
private extension Resolver {
    static func registerPresentationLayer() {
        register { DashboardViewModel(coordinator: resolve()) }
            .scope(.shared)
    }
}
