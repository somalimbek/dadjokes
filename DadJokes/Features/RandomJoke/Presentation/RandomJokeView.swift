//
//  RandomJokeView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

struct RandomJokeView: View {
    
    @InjectedObject private var viewModel: RandomJokeViewModel
    
    var body: some View {
        VStack {
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
            
            Button(RandomJokeResources.showPunchline, action: viewModel.showPunchline)
                .buttonStyle(.bordered)
                .disabled(viewModel.isLoading || viewModel.jokePunchline != nil)
            
            Button(RandomJokeResources.getNewJoke, action: viewModel.getNewJoke)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(RandomJokeResources.featureName)
        .onAppear(perform: viewModel.onAppear)
    }
}

struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
