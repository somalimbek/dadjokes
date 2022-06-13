//
//  View+Extensions.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 26..
//

import Foundation
import SwiftUI

extension View {
    var asDestination: Destination {
        AnyView(self)
    }
}
