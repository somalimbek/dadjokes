//
//  DashboardViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Foundation
import SwiftUI

final class DashboardViewModel: ObservableObject {
    
    // MARK: - Properties
    let navigationTitle = DashboardResources.featureName
    let menuList = [
        DashboardMenuListItem(title: RandomJokeResources.featureName, navigationDestination: DashboardNavigation.destinationForRandomJoke),
        DashboardMenuListItem(title: FavoritesResources.featureName, navigationDestination: DashboardNavigation.destinationForFavorites)
    ]
}
