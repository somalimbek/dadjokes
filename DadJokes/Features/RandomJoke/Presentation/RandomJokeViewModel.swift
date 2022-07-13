//
//  RandomJokeViewModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 07. 01..
//

import Resolver
import Combine

final class RandomJokeViewModel: ViewModel {
    
    // MARK: - Public Properties
    @Published var jokeSetup: String? { didSet { updateNewJokeButtonState() } }
    @Published var jokePunchline: String? { didSet { updateNewJokeButtonState() } }
    @Published var isShowPunchlineButtonEnabled = true
    @Published var isLoading = true
    @Published var showAlert = false
    @Published var error: Error? { didSet { checkIfNeedToShowAlert() } }
    
    // MARK: - Injected Properties
    private let getRandomJokeUseCase: GetRandomJokeUseCase = Resolver.resolve()
    
    // MARK: - Private Properties
    private var cancellableStore = Set<AnyCancellable>()
    private var joke: RandomJokeDomainModel? {
        didSet {
            jokeSetup = joke?.setup
            jokePunchline = nil
        }
    }
}

// MARK: - Public
extension RandomJokeViewModel {
    
    func onAppear() {
        getNewJoke()
    }
    
    func getNewJoke() {
        isLoading = true
        joke = nil
        getRandomJokeUseCase.execute()
            .sink(receiveCompletion: getNewJokeReceiveCompletion, receiveValue: getNewJokeReceiveValue)
            .store(in: &cancellableStore)
    }
    
    func showPunchline() {
        jokePunchline = joke?.punchline
    }
}

// MARK: - Private
private extension RandomJokeViewModel {
    
    func updateNewJokeButtonState() {
        isShowPunchlineButtonEnabled = jokeSetup != nil && jokePunchline == nil
    }
    
    func checkIfNeedToShowAlert() {
        if error != nil {
            showAlert = true
        }
    }
    
    func getNewJokeReceiveValue(_ newJoke: RandomJokeDomainModel) {
        joke = newJoke
        isLoading = false
    }
    
    func getNewJokeReceiveCompletion(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            self.error = error
        case .finished:
            break
        }
        isLoading = false
    }
}
