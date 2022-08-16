//
//  AppCoordinatorView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 16..
//

import SwiftUI

struct AppCoordinatorView: View {
    
    @StateObject var viewModel: AppCoordinatorViewModel
    
    var body: some View {
        NavigationView {
            VStack() {
                DashboardView()
                
                CoordinatorNode(isPresented: $viewModel.presentRandomJokeView) {
                    RandomJokeView()
                }
                
                CoordinatorNode(isPresented: $viewModel.presentFavoritesView) {
                    FavoritesView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
