//
//  RandomJokeDomainModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 24..
//

import Foundation

struct RandomJokeDomainModel {
    let setup: String
    let punchline: String
    
    init(fromDataModel dataModel: RandomJokeDataModel) {
        setup = dataModel.setup
        punchline = dataModel.punchline
    }
}
