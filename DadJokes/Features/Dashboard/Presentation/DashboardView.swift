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
    @InjectedObject private var viewModel: DashboardViewModel
    
    // MARK: - Body
    var body: some View {
        List(viewModel.menuList) { item in
            Button(item.title) {
                viewModel.selected(listItem: item)
            }
        }
        .navigationTitle(viewModel.navigationTitle)
    }
    
}

// MARK: - Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
