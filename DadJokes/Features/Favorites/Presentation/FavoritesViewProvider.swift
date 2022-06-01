//
//  FavoritesViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation
import SwiftUI

protocol FavoritesViewProvider: ViewProvider { }

struct FavoritesViewProviderImpl { }

extension FavoritesViewProviderImpl: FavoritesViewProvider {
    var rootView: AnyView { FavoritesView().anyView }
}
