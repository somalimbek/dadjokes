//
//  DadJokesApp.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 03. 23..
//

import Resolver
import SwiftUI

@main
struct DadJokesApp: App {
    
    @Injected private var viewProvider: AppViewProvider
    
    var body: some Scene {
        WindowGroup {
            viewProvider.rootView
        }
    }
}
