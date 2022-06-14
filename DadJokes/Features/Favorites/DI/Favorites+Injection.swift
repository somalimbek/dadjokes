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
        registerPresentation()
    }
}

// MARK: - Presentation
private extension Resolver {
    static func registerPresentation() {
        register { FavoritesView() }
        
        register { FavoritesViewProviderImpl() }
            .implements(FavoritesViewProvider.self)
    }
}
