//
//  Coordinator.swift
//  DadJokes
//
//  Created by Soma Limbek on 2022. 08. 17..
//

import Foundation
import SwiftUI

protocol Coordinator: AnyObject {
    var rootView: AnyView { get }
}
