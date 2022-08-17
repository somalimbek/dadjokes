//
//  AppCoordinatorView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 16..
//

import SwiftUI

struct AppCoordinatorView: View {
    
    @StateObject var viewModel: AppCoordinatorViewModel
    
    let dashboardCoordinatorView: DashboardCoordinatorView
    
    var body: some View {
        NavigationView {
            VStack() {
                dashboardCoordinatorView
            }
        }
        .navigationViewStyle(.stack)
    }
}
