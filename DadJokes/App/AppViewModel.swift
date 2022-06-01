//
//  AppViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 31..
//

import Foundation
import SwiftUI

final class AppViewModel: ObservableObject {
    
    // MARK: - Private properties
    private let viewProvider: AppViewProvider
    
    // MARK: - Init
    init(viewProvider: AppViewProvider) {
        self.viewProvider = viewProvider
    }
}

// MARK: - Public
extension AppViewModel {
    var dashboard: AnyView { viewProvider.dashboard }
}
