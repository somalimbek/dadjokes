//
//  RemoteDataSource.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 05..
//

import Combine
import Foundation

protocol RemoteDataSource {
    var baseURL: String { get }
    var path: String { get }
    var parameters: String { get }
    
    func publishURL() -> AnyPublisher<URL, URLError>
}

extension RemoteDataSource {
    func publishURL() -> AnyPublisher<URL, URLError> {
        return Future { promise in
            if let url = URL(string: baseURL + path + parameters) {
                promise(.success(url))
            } else {
                promise(.failure(URLError(.badURL)))
            }
        }
        .eraseToAnyPublisher()
    }
}
