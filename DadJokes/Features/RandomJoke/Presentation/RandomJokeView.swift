//
//  RandomJokeView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

struct RandomJokeView: View {
    var body: some View {
        VStack {
            Text(RandomJokeResources.featureName)
                .font(.title)
                .padding()
            Text(RandomJokeResources.description)
        }
    }
}

struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
