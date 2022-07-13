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
            jokeView
            
            showPunchlineButton
            
            getNewJokeButton
        }
        .setupNavigationBar()
        .setupAlert(isPresented: $viewModel.showAlert, errorMessage: viewModel.error?.localizedDescription)
        .onAppear(perform: viewModel.onAppear)
    }
}

// MARK: - View Setup
private extension View {
    
    func setupNavigationBar() -> some View {
        return self
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(RandomJokeResources.featureName)
    }
    
    func setupAlert(isPresented: Binding<Bool>, errorMessage: String?) -> some View {
        return self
            .alert(CommonResources.commonErrorTitle, isPresented: isPresented) { } message: {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                }
            }
    }
}

// MARK: - Private
private extension RandomJokeView {
    
    var jokeView: some View {
        VStack {
            if let jokeSetup = viewModel.jokeSetup {
                Text(jokeSetup)
                    .font(.title)
                    .padding()
            }
            if let jokePunchline = viewModel.jokePunchline {
                Text(jokePunchline)
            }
        }
        .loading(viewModel.isLoading)
    }
    
    var showPunchlineButton: some View {
        Button(RandomJokeResources.showPunchline, action: viewModel.showPunchline)
            .buttonStyle(.bordered)
            .disabled(!viewModel.isShowPunchlineButtonEnabled)
    }
    
    var getNewJokeButton: some View {
        Button(RandomJokeResources.getNewJoke, action: viewModel.getNewJoke)
            .disabled(viewModel.isLoading)
    }
}

// MARK: - Previews
struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
