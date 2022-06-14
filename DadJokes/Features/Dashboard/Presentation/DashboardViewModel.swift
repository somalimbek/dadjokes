//
//  DashboardViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Foundation
import SwiftUI

final class DashboardViewModel: ViewModel {
    
    // MARK: - Public Properties
    let navigationTitle = DashboardResources.featureName
    let menuList: [DashboardMenuListItem]
    
    // MARK: - Private Properties
    private let viewProvider: DashboardViewProvider
    
    // MARK: - Init
    init(viewProvider: DashboardViewProvider) {
        self.viewProvider = viewProvider
        self.menuList = Self.buildMenuList(viewProvider: viewProvider)
    }
}

// MARK: - Private
private extension DashboardViewModel {
    static func buildMenuList(viewProvider: DashboardViewProvider) -> [DashboardMenuListItem] {
        return [
            DashboardMenuListItem(title: RandomJokeResources.featureName, navigationDestination: viewProvider.randomJoke),
            DashboardMenuListItem(title: FavoritesResources.featureName, navigationDestination: viewProvider.favorites)
        ]
    }
}
