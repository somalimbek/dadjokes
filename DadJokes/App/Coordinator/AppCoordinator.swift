//
//  AppCoordinator.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 15..
//

import Foundation
import SwiftUI

protocol AppCoordinator: Coordinator { }

final class AppCoordinatorImpl {
    
    let rootView: AnyView
    let viewModel: AppCoordinatorViewModel
    
    init(rootView: AppCoordinatorView, viewModel: AppCoordinatorViewModel) {
        self.rootView = AnyView(rootView)
        self.viewModel = viewModel
    }
}

// MARK: - AppCoordinator
extension AppCoordinatorImpl: AppCoordinator { }
