//
//  RandomJokeRemoteDataSource.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 05..
//

import Combine
import Foundation

struct RandomJokeRemoteDataSource: RemoteDataSource {
    let baseURL = "https://v2.jokeapi.dev/"
    let path = "joke/"
    let parameters = "Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=twopart"
}

// MARK: - RandomJokeDataSource
extension RandomJokeRemoteDataSource: RandomJokeDataSource {    
    func getRandomJoke() -> AnyPublisher<RandomJokeDataModel, Error> {
        return publishURL()
            .flatMap { url in URLSession.shared.dataTaskPublisher(for: url) }
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: RandomJokeDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
