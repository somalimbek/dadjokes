//
//  ViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation
import SwiftUI

typealias Destination = AnyView

protocol ViewProvider {
    var rootView: Destination { get }
}
