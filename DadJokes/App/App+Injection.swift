//
//  App+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - App
extension Container {

    static let appViewProvider = Factory<AppViewProvider> {
        AppViewProviderImpl(dashboardViewProvider: dashboardViewProvider())
    }
}
