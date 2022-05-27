//
//  DashboardNavigation.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 27..
//

import Foundation
import SwiftUI

enum DashboardNavigation {
    static let destinationForRandomJoke = RandomJokeView().anyView
    static let destinationForFavorites = FavoritesView().anyView
}
