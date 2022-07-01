//
//  TestMocks+Injection.swift
//  DadJokesTests
//
//  Created by Soma Limbek on 2022. 06. 30..
//

import Resolver

extension Resolver {
    
    private static var _testMock: Resolver!
    
    static var testMock: Resolver {
        if _testMock == nil {
            _testMock = Resolver(child: Resolver.root)
            Resolver.root = _testMock
        }
        return _testMock
    }
}
