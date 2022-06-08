//
//  AppViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation
import SwiftUI

protocol AppViewProvider: ViewProvider {
    var dashboard: AnyView { get }
}

struct AppViewProviderImpl {
    
    // MARK: - Properties
    private let dashboardViewProvider: DashboardViewProvider
    
    // MARK: - Init
    init(dashboardViewProvider: DashboardViewProvider) {
        self.dashboardViewProvider = dashboardViewProvider
    }
}

// MARK: - AppViewProvider
extension AppViewProviderImpl: AppViewProvider {
    var rootView: AnyView { AppView(viewModel: AppViewModelImpl(viewProvider: self)).anyView }
    var dashboard: AnyView { dashboardViewProvider.rootView }
}
