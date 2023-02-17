//
//  RandomJokeView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

struct RandomJokeView: View {
    
    // MARK: - ViewModel
    @InjectedObject private var viewModel: RandomJokeViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            JokeView(
                viewModel: viewModel
            )
        }
        .setUpNavigationBar()
        .setUpAlert(isPresented: $viewModel.showAlert, errorMessage: viewModel.error?.localizedDescription)
        .onAppear(perform: viewModel.onAppear)
    }
}

// MARK: - View Set up
private extension View {
    
    func setUpNavigationBar() -> some View {
        return self
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(RandomJokeResources.featureName)
    }
    
    func setUpAlert(isPresented: Binding<Bool>, errorMessage: String?) -> some View {
        return self
            .alert(CommonResources.commonErrorTitle, isPresented: isPresented) { } message: {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                }
            }
    }
}

// MARK: - Previews
struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
