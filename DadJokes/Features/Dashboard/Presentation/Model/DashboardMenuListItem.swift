//
//  DashboardMenuListItem.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation
import SwiftUI

struct DashboardMenuListItem: Identifiable {
    
    // MARK: - Public Properties
    let id = UUID()
    let title: String
    let navigationDestination: AnyView
}
