//
//  DadJokesApp.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 03. 23..
//

import Factory
import SwiftUI

@main
struct DadJokesApp: App {
    
    @Injected(\.appViewProvider) private var viewProvider
    
    var body: some Scene {
        WindowGroup {
            viewProvider.rootView
        }
    }
}
