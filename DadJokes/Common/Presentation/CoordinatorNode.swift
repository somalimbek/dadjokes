//
//  CoordinatorNode.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 16..
//

import SwiftUI

struct CoordinatorNode<Target: View>: View {
    
    @Binding var isPresented: Bool
    var target: Target
    
    init(isPresented: Binding<Bool>, @ViewBuilder target: () -> Target) {
        self._isPresented = isPresented
        self.target = target()
    }
    
    var body: some View {
        NavigationLink(
            isActive: $isPresented,
            destination: {
                target
            },
            label: {
                EmptyView()
            }
        )
    }
}
