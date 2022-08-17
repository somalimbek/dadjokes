//
//  DashboardCoordinatorView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 17..
//

import SwiftUI

struct DashboardCoordinatorView: View {
    
    @StateObject var viewModel: DashboardCoordinatorViewModel
    
    var body: some View {
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
}
