//
//  FavoritesViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation

protocol FavoritesViewProvider: ViewProvider { }

struct FavoritesViewProviderImpl { }

extension FavoritesViewProviderImpl: FavoritesViewProvider {
    var rootView: Destination { FavoritesView().asDestination }
}
