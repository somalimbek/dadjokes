//
//  ViewProvider.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 05. 30..
//

import Foundation
import SwiftUI

protocol ViewProvider {
    static var rootView: AnyView { get }
}
