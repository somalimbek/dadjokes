//
//  AppViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation

protocol AppViewProvider: ViewProvider { }

struct AppViewProviderImpl {
    
    // MARK: - Injected Properties
    private let dashboardViewProvider: ViewProvider
    
    // MARK: - Init
    init(dashboardViewProvider: ViewProvider) {
        self.dashboardViewProvider = dashboardViewProvider
    }
}

// MARK: - AppViewProvider
extension AppViewProviderImpl: AppViewProvider {
    var rootView: Destination { dashboardViewProvider.rootView }
}
