//
//  JokeViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2023. 02. 17..
//

import Foundation

protocol JokeViewModel: ViewModel {

    var jokeSetup: String? { get }
    var jokePunchline: String? { get }
    var isShowPunchlineButtonEnabled: Bool { get }
    var isLoading: Bool { get }

    func onNextJoke()
    func onShowPunchline()
}
