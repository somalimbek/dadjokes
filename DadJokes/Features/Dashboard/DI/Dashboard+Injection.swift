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
        register { DashboardView() }
        
        register { DashboardViewModel() }
            .scope(.shared)
        
        register { DashboardViewProviderImpl() }
            .implements(DashboardViewProvider.self)
    }
}
