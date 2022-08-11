//
//  XCTest+Combine.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 08. 11..
//

import Combine
import Foundation
import XCTest

extension XCTestCase {
    
    func expectation<T: Publisher>(forPublisher publisher: T, fulfillAfter count: Int = 1) -> Cancellable {
        let expectation = expectation(description: "Waiting for values emitted by publisher: \(publisher)")
        return publisher
            .dropFirst()
            .collect(count)
            .sink(receiveCompletion: { _ in
                expectation.fulfill()
            }, receiveValue: { _ in
                expectation.fulfill()
            })
    }
}
