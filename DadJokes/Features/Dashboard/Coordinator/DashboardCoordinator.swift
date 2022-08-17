//
//  DashboardCoordinator.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 17..
//

import Foundation
import SwiftUI

protocol DashboardCoordinator: Coordinator {
    func pushRandomJokeView()
    func pushFavoritesView()
}

final class DashboardCoordinatorImpl {
    
    let rootView: AnyView
    let viewModel: DashboardCoordinatorViewModel
    
    init(rootView: DashboardCoordinatorView, viewModel: DashboardCoordinatorViewModel) {
        self.rootView = AnyView(rootView)
        self.viewModel = viewModel
    }
}

// MARK: - DashboardCoordinator
extension DashboardCoordinatorImpl: DashboardCoordinator {
    
    func pushRandomJokeView() {
        viewModel.presentRandomJokeView = true
    }
    
    func pushFavoritesView() {
        viewModel.presentFavoritesView = true
    }
}
