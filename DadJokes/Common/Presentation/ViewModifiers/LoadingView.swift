//
//  LoadingView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 07. 05..
//

import SwiftUI

struct LoadingView: ViewModifier {
    
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        if isLoading {
            ProgressView()
        } else {
            content
        }
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingView(isLoading: isLoading))
    }
}
