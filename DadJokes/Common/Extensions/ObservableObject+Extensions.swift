//
//  ObservableObject+Extensions.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 06. 01..
//

import Foundation
import SwiftUI

extension ObservableObject {
    var wrappedInStateObject: StateObject<Self> {
        StateObject(wrappedValue: self)
    }
}
