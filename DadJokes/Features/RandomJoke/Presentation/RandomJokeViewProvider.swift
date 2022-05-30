//
//  RandomJokeViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation

enum RandomJokeViewProvider: ViewProvider {
    static let rootView = RandomJokeView().anyView
}
