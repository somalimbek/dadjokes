//
//  AppView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 31..
//

import SwiftUI

struct AppView<ViewModel: AppViewModel>: View {
    
    // MARK: - Properties
    @StateObject private var viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self._viewModel = viewModel.wrappedInStateObject
    }
    
    // MARK: - Body
    var body: some View {
        viewModel.dashboard
    }
}

// MARK: - Preview
struct AppView_Previews: PreviewProvider {
    
    static let appViewModel = AppViewModelImpl(viewProvider: AppViewProviderImpl(dashboardViewProvider: DashboardViewProviderImpl(randomJokeViewProvider: RandomJokeViewProviderImpl(), favoritesViewProvider: FavoritesViewProviderImpl())))
    
    static var previews: some View {
        AppView(viewModel: appViewModel)
    }
}
