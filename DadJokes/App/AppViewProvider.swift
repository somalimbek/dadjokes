//
//  AppViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Resolver
import SwiftUI

protocol AppViewProvider: ViewProvider { }

struct AppViewProviderImpl {
    
    // MARK: - Properties
    @Injected private var dashboardViewProvider: DashboardViewProvider
}

// MARK: - AppViewProvider
extension AppViewProviderImpl: AppViewProvider {
    var rootView: Destination { dashboardViewProvider.rootView }
}
