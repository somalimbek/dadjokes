//
//  AppView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 31..
//

import SwiftUI

struct AppView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel: AppViewModel
    
    // MARK: - Init
    init(viewModel: AppViewModel) {
        self._viewModel = viewModel.wrappedInStateObject
    }
    
    // MARK: - Body
    var body: some View {
        viewModel.dashboard
    }
}

// MARK: - Preview
struct AppView_Previews: PreviewProvider {
    
    static let appViewModel = AppViewModel(viewProvider: AppViewProviderImpl(dashboardViewProvider: DashboardViewProviderImpl(randomJokeViewProvider: RandomJokeViewProviderImpl(), favoritesViewProvider: FavoritesViewProviderImpl())))
    
    static var previews: some View {
        AppView(viewModel: appViewModel)
    }
}
