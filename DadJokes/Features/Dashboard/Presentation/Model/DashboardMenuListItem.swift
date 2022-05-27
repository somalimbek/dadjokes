//
//  DashboardMenuListItem.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation
import SwiftUI

struct DashboardMenuListItem {
    
    // MARK: - Properties
    let title: String
    let navigationDestination: AnyView
}

// MARK: - Identifiable
extension DashboardMenuListItem: Identifiable {
    private static var nextId = 0
    var id: Int {
        let id = Self.nextId
        Self.nextId += 1
        return id
    }
}
