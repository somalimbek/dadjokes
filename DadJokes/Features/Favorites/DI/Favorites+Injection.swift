//
//  Favorites+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Factory

// MARK: - Presentation
extension Container {
    
    static let favoritesViewProvider = Factory<FavoritesViewProvider> {
        FavoritesViewProviderImpl()
    }
}
