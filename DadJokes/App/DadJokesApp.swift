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
    
    let viewProvider: AppViewProvider = Resolver.resolve()
    
    var body: some Scene {
        WindowGroup {
            viewProvider.rootView
        }
    }
}
