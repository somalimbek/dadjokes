//
//  FavoritesView.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Resolver
import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text(FavoritesResources.featureName)
                .font(.title)
                .padding()
            Text(FavoritesResources.featureDescription)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
