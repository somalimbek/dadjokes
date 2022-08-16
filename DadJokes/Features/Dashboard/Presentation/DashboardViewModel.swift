//
//  DashboardViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver

final class DashboardViewModel: ViewModel {
    
    // MARK: - Injected Properties
    private let coordinator: AppCoordinator
    
    // MARK: - Init
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Properties
    let navigationTitle = DashboardResources.featureName
    var menuList: [DashboardMenuListItem] {
        [
            DashboardMenuListItem(title: RandomJokeResources.featureName, navigationDestination: .randomJoke),
            DashboardMenuListItem(title: FavoritesResources.featureName, navigationDestination: .favorites),
        ]
    }
    
    func selected(listItem: DashboardMenuListItem) {
        switch (listItem.navigationDestination) {
        case .randomJoke:
            coordinator.pushRandomJokeView()
        case .favorites:
            coordinator.pushFavoritesView()
        }
    }
}
