//
//  NetworkingTestMock.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 07. 13..
//

import Combine

protocol NetworkingTestMock {
    var success: Bool { get set }
    func futureAsAnyPublisher<Output, E: Error>(output: Output, error: E) -> AnyPublisher<Output, E>
}

extension NetworkingTestMock {
    
    func futureAsAnyPublisher<Output, E: Error>(output: Output, error: E) -> AnyPublisher<Output, E> {
        return Future { promise in
            if self.success {
                promise(.success(output))
            } else {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
