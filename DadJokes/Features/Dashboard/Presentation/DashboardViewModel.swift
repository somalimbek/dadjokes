//
//  DashboardViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

final class DashboardViewModel: ViewModel {
    
    // MARK: - Injected Properties
    @Injected private var viewProvider: DashboardViewProvider
    
    // MARK: - Public Properties
    let navigationTitle = DashboardResources.featureName
    var menuList: [DashboardMenuListItem] {
        [
            DashboardMenuListItem(title: RandomJokeResources.featureName, navigationDestination: viewProvider.randomJoke),
            DashboardMenuListItem(title: FavoritesResources.featureName, navigationDestination: viewProvider.favorites),
        ]
    }
}
