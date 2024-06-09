//
//  ViewRouter.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

enum Roots {
    case welcome
    case signIn
    case bottomTabBar
}

class ViewRouter: ObservableObject {
    
    @Published var currentRoot: Roots = .welcome
    
    static let shared = ViewRouter()

    fileprivate init() {
        //.bottomTabBar
        //check local user and logic
        // check authorization type
    }
}

