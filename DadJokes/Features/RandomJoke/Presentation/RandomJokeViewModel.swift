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
    @Published var jokeSetup: String?
    @Published var jokePunchline: String? { didSet { updateNewJokeButtonState() } }
    @Published var isNewJokeButtonDisabled = true
    @Published var isLoading = true { didSet { updateNewJokeButtonState() } }
    
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
        getRandomJokeUseCase.execute()
            .sink(receiveCompletion: { [weak self] error in
                print(error)
                self?.isLoading = false
            }, receiveValue: { [weak self] newJoke in
                self?.joke = newJoke
                self?.isLoading = false
            })
            .store(in: &cancellableStore)
    }
    
    func showPunchline() {
        jokePunchline = joke?.punchline
    }
}

// MARK: - Private
private extension RandomJokeViewModel {
    
    func updateNewJokeButtonState() {
        isNewJokeButtonDisabled = isLoading || jokePunchline != nil
    }
}
