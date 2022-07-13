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
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(RandomJokeResources.featureName)
        .onAppear(perform: viewModel.onAppear)
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
            .disabled(viewModel.isLoading || viewModel.jokePunchline != nil)
    }
    
    var getNewJokeButton: some View {
        Button(RandomJokeResources.getNewJoke, action: viewModel.getNewJoke)
    }
}

struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
