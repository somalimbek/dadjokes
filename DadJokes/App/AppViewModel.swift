//
//  AppViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 31..
//

import Foundation
import SwiftUI

protocol AppViewModel: ObservableObject {
    var dashboard: Destination { get }
}

final class AppViewModelImpl {
    
    // MARK: - Private properties
    private let viewProvider: AppViewProvider
    
    // MARK: - Init
    init(viewProvider: AppViewProvider) {
        self.viewProvider = viewProvider
    }
}

// MARK: - Public
extension AppViewModelImpl: AppViewModel {
    var dashboard: Destination { viewProvider.dashboard }
}
