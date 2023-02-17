//
//  RandomJokeViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation

protocol RandomJokeViewProvider: ViewProvider { }

struct RandomJokeViewProviderImpl { }

extension RandomJokeViewProviderImpl: RandomJokeViewProvider {
    var rootView: Destination { RandomJokeView().asDestination }
}
