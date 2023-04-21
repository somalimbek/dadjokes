//
//  App+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - App
extension Container {

    var appViewProvider: Factory<AppViewProvider> {
        self {
            AppViewProviderImpl(dashboardViewProvider: self.dashboardViewProvider())
        }
    }
}
