//
//  RandomJokeDataModel.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 29..
//

import Foundation

struct RandomJokeDataModel: Codable {
    let setup: String
    let punchline: String
    
    enum CodingKeys: String, CodingKey {
        case setup
        case punchline = "delivery"
    }
}
