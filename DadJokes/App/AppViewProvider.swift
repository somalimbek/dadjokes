//
//  AppViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation
import SwiftUI

protocol AppViewProvider: ViewProvider {
    var dashboard: Destination { get }
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
    var rootView: Destination { AppView(viewModel: AppViewModel(viewProvider: self)).asDestination }
    var dashboard: Destination { dashboardViewProvider.rootView }
}
