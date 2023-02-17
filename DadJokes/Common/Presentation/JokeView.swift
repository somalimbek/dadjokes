//
//  JokeView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2023. 02. 17..
//

import SwiftUI

struct JokeView<VM: JokeViewModel>: View {

    @ObservedObject var viewModel: VM

    // MARK: - Body
    var body: some View {
        VStack {
            jokeView

            primaryButton

            secondaryButton
        }
    }
}

// MARK: - Private
private extension JokeView {

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

    var primaryButton: some View {
        Button(RandomJokeResources.showPunchline, action: viewModel.onShowPunchline)
            .buttonStyle(.bordered)
            .disabled(!viewModel.isShowPunchlineButtonEnabled)
    }

    var secondaryButton: some View {
        Button(RandomJokeResources.getNewJoke, action: viewModel.onNextJoke)
            .disabled(viewModel.isLoading)
    }
}

// MARK: - Previews
struct JokeView_Previews: PreviewProvider {
    static var previews: some View {

        // MARK: - Loading
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: nil,
                jokePunchline: nil,
                isShowPunchlineButtonEnabled: false,
                isLoading: true
            )
        )

        // MARK: - Setup only
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: "Setup",
                jokePunchline: nil,
                isShowPunchlineButtonEnabled: true,
                isLoading: false
            )
        )

        // MARK: - Punchline shown
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: "Setup",
                jokePunchline: "Punchline",
                isShowPunchlineButtonEnabled: false,
                isLoading: false
            )
        )

        // MARK: - Long setup
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: longText,
                jokePunchline: "Punchline",
                isShowPunchlineButtonEnabled: false,
                isLoading: false
            )
        )

        // MARK: - Long punchline
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: "Setup",
                jokePunchline: longText,
                isShowPunchlineButtonEnabled: false,
                isLoading: false
            )
        )

        // MARK: - Long setup, long punchline
        JokeView(
            viewModel: JokeViewModelMock(
                jokeSetup: longText,
                jokePunchline: longText,
                isShowPunchlineButtonEnabled: false,
                isLoading: false
            )
        )
    }

    static let longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada cursus ex id vulputate."
}

// MARK: - Mock for previews

fileprivate final class JokeViewModelMock: JokeViewModel {
    var jokeSetup: String?
    var jokePunchline: String?
    var isShowPunchlineButtonEnabled: Bool
    var isLoading: Bool

    init(jokeSetup: String? = nil, jokePunchline: String? = nil, isShowPunchlineButtonEnabled: Bool, isLoading: Bool) {
        self.jokeSetup = jokeSetup
        self.jokePunchline = jokePunchline
        self.isShowPunchlineButtonEnabled = isShowPunchlineButtonEnabled
        self.isLoading = isLoading
    }

    func onNextJoke() { }
    func onShowPunchline() { }
}
