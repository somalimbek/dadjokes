//
//  DashboardMenuListItem.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation

struct DashboardMenuListItem: Identifiable {
    // MARK: - Public Properties
    let id = UUID()
    let title: String
    let navigationDestination: Destination
    
    enum Destination {
        case randomJoke, favorites
    }
}
