//
//  DashboardView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import SwiftUI

struct DashboardView<ViewModel: DashboardViewModel>: View {
    
    // MARK: - Properties
    @StateObject private var viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self._viewModel = viewModel.wrappedInStateObject
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List(viewModel.menuList) {
                NavigationLink($0.title, destination: $0.navigationDestination)
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .navigationViewStyle(.stack)
    }
    
}

// MARK: - Preview
struct DashboardView_Previews: PreviewProvider {
    
    static let dashboardViewModel = DashboardViewModelImpl(viewProvider: DashboardViewProviderImpl(randomJokeViewProvider: RandomJokeViewProviderImpl(), favoritesViewProvider: FavoritesViewProviderImpl()))
    
    static var previews: some View {
        DashboardView(viewModel: dashboardViewModel)
    }
}
