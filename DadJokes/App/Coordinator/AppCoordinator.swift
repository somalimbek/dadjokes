//
//  AppCoordinator.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 15..
//

import Foundation
import Resolver
import SwiftUI

protocol Coordinator: AnyObject {
    var rootView: AnyView { get }
}

protocol AppCoordinator: Coordinator {
    func pushRandomJokeView()
    func pushFavoritesView()
}

final class AppCoordinatorImpl {
    
    let rootView: AnyView
    let viewModel: AppCoordinatorViewModel
    
    init(rootView: AppCoordinatorView, viewModel: AppCoordinatorViewModel) {
        self.rootView = AnyView(rootView)
        self.viewModel = viewModel
    }
}

// MARK: - AppCoordinator
extension AppCoordinatorImpl: AppCoordinator {
    
    func pushRandomJokeView() {
        viewModel.presentRandomJokeView = true
    }
    
    func pushFavoritesView() {
        viewModel.presentFavoritesView = true
    }
}
