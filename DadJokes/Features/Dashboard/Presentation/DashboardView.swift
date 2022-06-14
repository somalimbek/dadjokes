//
//  DashboardView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

struct DashboardView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel: DashboardViewModel
    
    // MARK: - Init
    init(viewModel: DashboardViewModel) {
        self._viewModel = viewModel.wrappedInStateObject
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List(viewModel.menuList) {
                NavigationLink($0.title, destination: $0.navigationDestination)
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .navigationViewStyle(.stack)
    }
    
}

// MARK: - Preview
struct DashboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        Resolver.resolve(DashboardView.self)
    }
}
