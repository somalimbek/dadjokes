//
//  Favorites+Injection.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 14..
//

import Resolver

// MARK: - Favorites
extension Resolver {
    static func registerFavorites() {
        registerPresentationLayer()
    }
}

// MARK: - Names
extension Resolver.Name {
    static let favorites = Self(FavoritesResources.featureName)
}

// MARK: - Presentation
private extension Resolver {
    static func registerPresentationLayer() {
        register { FavoritesViewProviderImpl() as FavoritesViewProvider }
            .implements(ViewProvider.self, name: .favorites)
    }
}

import Factory

// MARK: - Presentation
extension Container {
    
    static let favoritesViewProvider = Factory<FavoritesViewProvider> {
        FavoritesViewProviderImpl()
    }
}
