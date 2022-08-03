//
//  Loading.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 07. 05..
//

import SwiftUI

struct Loading: ViewModifier {
    
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        if isLoading {
            ProgressView()
                .padding()
        } else {
            content
        }
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(Loading(isLoading: isLoading))
    }
}
