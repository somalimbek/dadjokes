//
//  RandomJokeViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Resolver

protocol RandomJokeViewProvider: ViewProvider { }

struct RandomJokeViewProviderImpl { }

extension RandomJokeViewProviderImpl: RandomJokeViewProvider {
    var rootView: Destination { Resolver.resolve(RandomJokeView.self).asDestination }
}
