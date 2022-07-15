//
//  RandomJokeDataSource.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 29..
//

import Combine

protocol RandomJokeDataSource {
    func getRandomJoke() -> AnyPublisher<RandomJokeDataModel, Error>
}
